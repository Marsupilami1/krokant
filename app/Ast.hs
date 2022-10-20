module Ast where

data Condition
  = CAnd Condition Condition
  | COr Condition Condition
  | CSense Flag SenseDir
  | CRand Int
  deriving Show

type Program = [Decl]
data Decl
  = Fun String Statements
  | State String Statements
  deriving Show

type Args = [String]
type Statements = [Statement]
data Statement
  = IfThenElse Condition Statements Statements
  | Mark Int
  | Unmark Int
  | Pickup Statements
  | Drop
  | Pass
  | Switch String
  | Turn Dir
  | Move Statements
  | Call String
  deriving Show

data SenseDir
  = Here
  | Ahead
  | LeftAhead
  | RightAhead
  deriving Show

data Flag
  = Friend
  | Foe
  | FriendWithFood
  | FoeWithFood
  | Food
  | Rock
  | Marker Int
  | FoeMarker
  | Home
  | FoeHome
  deriving Show

data Dir
  = DLeft
  | DRight
  deriving (Eq, Show)
