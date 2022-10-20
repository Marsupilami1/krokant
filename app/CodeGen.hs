{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module CodeGen (translateProgram, prettyPrintAsmInstruction) where

import qualified Ast as Ast
import Data.List (partition)

import qualified Data.Map as M
import Data.Map (Map)

import Control.Monad.Except
import Control.Monad.State
import Control.Monad.Reader

type Label = String

data LR
  = DLeft
  | DRight
  deriving Show

data Asm
  = Goto Label
  | Sense Ast.SenseDir Label Label Ast.Flag
  | Mark Int
  | Unmark Int
  | PickUp Label
  | Drop
  | Turn LR
  | Move Label
  | Flip Int Label Label
  | Label Label
  deriving Show

prettyPrintAsmInstruction :: Asm -> String
prettyPrintAsmInstruction (Goto lbl) =
  "  Goto " ++ lbl
prettyPrintAsmInstruction (Sense sdir lbl1 lbl2 flg) =
  "  Sense " ++ show sdir ++ " " ++ lbl1 ++ " " ++ lbl2 ++ " " ++ show flg
prettyPrintAsmInstruction (Mark n) =
  "  Mark " ++ show n
prettyPrintAsmInstruction (Unmark n) =
  "  Unmark " ++ show n
prettyPrintAsmInstruction (PickUp lbl) =
  "  PickUp " ++ lbl
prettyPrintAsmInstruction (Drop) =
  "  Drop"
prettyPrintAsmInstruction (Turn DLeft) =
  "  Turn Left"
prettyPrintAsmInstruction (Turn DRight) =
  "  Turn Right"
prettyPrintAsmInstruction (Move lbl) =
  "  Move " ++ lbl
prettyPrintAsmInstruction (Flip p lbl1 lbl2) =
  "  Flip " ++ show p ++ " " ++ lbl1 ++ " " ++ lbl2
prettyPrintAsmInstruction (Label lbl) =
  lbl ++ ":"


newtype Env = Env (Map String (Gen [Asm]))
newtype Freshness a = Fresh { unFresh :: (State Int a) }
  deriving (Functor, Applicative, Monad, MonadState Int)

runFreshness :: Freshness a -> a
runFreshness m = evalState (unFresh m) 0
-- Generation monad
type Gen a = ReaderT Env (ExceptT String Freshness) a

runGen :: Gen a -> Env -> Either String a
runGen m e = runFreshness $ runExceptT $ runReaderT m e

translateProgram :: Ast.Program -> Either String [Asm]
translateProgram p =
  let funsMap = M.fromList [(name, toAsm stmts) | (Ast.Fun name stmts) <- funs] in
  runGen (toAsm (reverse states)) (Env funsMap)
  where
    (states, other) = partition isState p
    (funs, _globals) = partition isFun other
    isState (Ast.State _ _) = True
    isState _ = False
    isFun (Ast.Fun _ _) = True
    isFun _ = False

fresh :: Gen Int
fresh = do
  modify (+1)
  get

class ToAsm a where
  toAsm :: a -> Gen [Asm]

instance ToAsm Ast.Program where
  toAsm states = do
    concat <$> mapM toAsm states

instance ToAsm Ast.Decl where
  toAsm (Ast.State name stmts) = do
    stmtsAsm <- toAsm stmts
    return $
      [ Label name
      ] ++ stmtsAsm ++
      [ Goto name
      ]

  toAsm (Ast.Fun _ _) = do
    throwError "Cannot translate fun to Asm."

  toAsm (Ast.Global _ _ _) = do
    throwError "Cannot translate global to Asm."

instance ToAsm Ast.Statements where
  toAsm stmts = do
    concat <$> mapM toAsm stmts

instance ToAsm Ast.Statement where
  toAsm (Ast.IfThenElse c stmtsThen stmtsElse) = do
    n <- fresh
    let lblThen = "_IFthen" ++ show n
        lblElse = "_IFelse" ++ show n
        lblEnd = "_IFend" ++ show n
    thenBlock <- toAsm stmtsThen
    elseBlock <- toAsm stmtsElse
    case c of
      Ast.CSense flg dir ->
        return $
          [ Sense dir lblThen lblElse flg
          , Label lblThen
          ] ++ thenBlock ++
          [ Goto lblEnd
          , Label lblElse
          ] ++ elseBlock ++
          [ Goto lblEnd
          , Label lblEnd
          ]
      Ast.CRand p ->
        return $
          [ Flip p lblThen lblElse
          , Label lblThen
          ] ++ thenBlock ++
          [ Goto lblEnd
          , Label lblElse
          ] ++ elseBlock ++
          [ Goto lblEnd
          , Label lblEnd
          ]
      Ast.CAnd c1 c2 ->
        toAsm $ Ast.IfThenElse c1 [Ast.IfThenElse c2 stmtsThen stmtsElse] stmtsElse
      Ast.COr c1 c2 ->
        toAsm $ Ast.IfThenElse c1 stmtsThen [Ast.IfThenElse c2 stmtsThen stmtsElse]

  toAsm (Ast.Mark n) =
    return [Mark n]

  toAsm (Ast.Unmark n) =
    return [Unmark n]

  toAsm (Ast.Pickup stmts) = do
    stmtsAsm <- toAsm stmts
    n <- fresh
    let lblError = "_PickupFail" ++ show n
        lblSuccess = "_PickupSuccess" ++ show n
    return $
      [ PickUp lblError
      , Goto lblSuccess
      , Label lblError
      ] ++ stmtsAsm ++
      [ Goto lblSuccess
      , Label lblSuccess ]

  toAsm (Ast.Drop) =
    return [Drop]

  toAsm (Ast.Pass) =
    return []

  toAsm (Ast.Switch lbl) =
    return [Goto lbl]

  toAsm (Ast.Turn dir)
    | dir == Ast.DLeft =
      return [Turn DLeft]
    | otherwise =
      return [Turn DRight]

  toAsm (Ast.Move stmts) = do
    stmtsAsm <- toAsm stmts
    n <- fresh
    let lblError = "_MoveFail" ++ show n
        lblSuccess = "_MoveSuccess" ++ show n
    return $
      [ Move lblError
      , Goto lblSuccess
      , Label lblError
      ] ++ stmtsAsm ++
      [ Goto lblSuccess
      , Label lblSuccess
      ]

  toAsm (Ast.Call funName) = do
    Env env <- ask
    case M.lookup funName env of
      Nothing -> throwError $ "Function " ++ funName ++ " is not defined."
      Just gen -> gen
