{
module Lexer where

import Ast
}

%wrapper "basic"

$digit = 0-9            -- digits
$alpha = [a-zA-Z]       -- alphabetic characters

tokens :-
  $white+                        ;
  "//".*                         ;
  "{"                            { const TLBrace}
  "}"                            { const TRBrace }
  "("                            { const TLPar}
  ")"                            { const TRPar }
  ","                            { const TComma }
  ";"                            { const TSemicolon }
  "&&"                           { const TAnd }
  "||"                           { const TOr }
  fn                             { const TFn }
  state                          { const TState }
  if                             { const TIf }
  else                           { const TElse }

  -- Statements
  mark                           { const TMark   }
  unmark                         { const TUnmark }
  pickup                         { const TPickup }
  drop                           { const TDrop   }
  turn                           { const TTurn   }
  move                           { const TMove   }
  rand                           { const TRand   }
  pass                           { const TPass   }
  switch                         { const TSwitch }


  -- SenseDir
  Ahead                          { const TAhead}
  Here                           { const THere }
  LeftAhead                      { const TLeftAhead }
  RightAhead                     { const TRightAhead }

  -- Flags
  Friend                         { const TFriend }
  Foe                            { const TFoe }
  FriendWithFood                 { const TFriendWithFood }
  FoeWithFood                    { const TFoeWithFood }
  Rock                           { const TRock }
  Food                           { const TFood }
  M[0-9]+                        { TMarker . read . tail }
  FoeMarker                      { const TFoeMarker }
  Home                           { const THome }
  FoeHome                        { const TFoeHome }

  -- Dir
  Left                           { const TLeft }
  Right                          { const TRight }

  $digit+                        { \s -> TInt (read s) }
  $alpha [$alpha $digit \_ \']*  { \s -> TVar s }

{
-- Each action has type :: String -> Token

-- The token type:
data Token
  = TEOF
  | TLBrace
  | TRBrace
  | TLPar
  | TRPar
  | TComma
  | TSemicolon
  | TAnd
  | TOr
  | TFn
  | TState
  | TIf
  | TElse

  -- Statements
  | TMark
  | TUnmark
  | TPickup
  | TDrop
  | TTurn
  | TMove
  | TRand
  | TPass
  | TSwitch

  -- SenseDir
  | TAhead
  | THere
  | TLeftAhead
  | TRightAhead

  -- Flag
  | TFriend
  | TFoe
  | TFriendWithFood
  | TFoeWithFood
  | TRock
  | TFood
  | TMarker Int
  | TFoeMarker
  | THome
  | TFoeHome

  -- Dir
  | TLeft
  | TRight

  | TInt Int
  | TVar String
  deriving (Eq, Show)
}
