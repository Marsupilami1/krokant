module Main (main) where

import Lexer
import Parser
import CodeGen

import System.Environment
import System.IO
import System.Exit

main :: IO ()
main = do
  argv <- getArgs
  let filename = argv !! 0
  contents <- readFile filename
  let parsetree = parse (alexScanTokens $ init $ contents)
  case translateProgram parsetree of
    Left err -> do
      hPutStrLn stderr "Program generation failed !"
      hPutStrLn stderr err
      exitFailure
    Right v -> do
      mapM_ (putStrLn . prettyPrintAsmInstruction) v
