{
{-# LANGUAGE OverloadedStrings #-}

module Parser where

import Lexer
import Ast
import System.IO.Unsafe
import System.Exit

}


-- mandatory information for happy
--%monad { P }
--%lexer { lexer } { TEOF }

-- parser function name
%name      parse
-- we need to hardcode the type there
%tokentype { Token }
%errorhandlertype explist
%error     { parseError }

%token
'{'    { TLBrace }
'}'    { TRBrace }
'('    { TLPar }
')'    { TRPar }
','    { TComma }
';'    { TSemicolon }
'&&'   { TAnd }
'||'   { TOr }
'='    { TEq }
'<='   { TLower }
fn     { TFn }
state  { TState }
global { TGlobal }
if     { TIf }
else   { TElse }

mark   { TMark }
unmark { TUnmark }
pickup { TPickup }
drop   { TDrop   }
turn   { TTurn   }
move   { TMove   }
rand   { TRand   }
pass   { TPass   }
switch { TSwitch }

int    { TInt $$ }
var    { TVar $$ }

-- SenseDir
ahead       { TAhead }
here        { THere }
leftAhead   { TLeftAhead }
rightAhead  { TRightAhead }

-- Flag
friend         { TFriend         }
foe            { TFoe            }
friendWithFood { TFriendWithFood }
foeWithFood    { TFoeWithFood    }
rock           { TRock           }
food           { TFood           }
marker         { TMarker $$      }
foeMarker      { TFoeMarker      }
home           { THome           }
foeHome        { TFoeHome        }

-- Dir
left           { TLeft }
right          { TRight }


-- Operators precedence
-- %right if
-- %left '*' '/' '%'
%left '||'
%left '&&'

%%
-- Grammar

Program :: { Program }
  : Decl { [$1] }
  | Program Decl { $2 : $1 }

Decl :: { Decl }
  : fn var '(' ')' '{' Statements '}' { Fun $2 (reverse $6)}
  | state var '{' Statements '}' { State $2 (reverse $4)}
  | global var '=' int '<=' int { Global $2 $4 $6}

Statements :: { Statements }
  : Statement { [$1] }
  | Statements Statement { $2 : $1 }

Statement :: { Statement }
  : if '(' Condition ')' '{' Statements '}' { IfThenElse $3 (reverse $6) [] }
  | if '(' Condition ')' '{' Statements '}' else '{' Statements '}' { IfThenElse $3 (reverse $6) (reverse $10) }
  | mark int ';' { Mark $2 }
  | unmark int ';' { Unmark $2 }
  | pickup '{' Statements '}' { Pickup (reverse $3) }
  | drop ';' { Drop }
  | pass ';' { Pass }
  | switch var ';' { Switch $2 }
  | turn Dir ';' { Turn $2 }
  | move '{' Statements '}' { Move (reverse $3) }
  | var '(' ')' ';' { Call $1 }

Condition :: { Condition }
  : Condition '&&' Condition { CAnd $1 $3 }
  | Condition '||' Condition { COr $1 $3 }
  | '(' Condition ')' { $2 }
  | Flag SenseDir { CSense $1 $2 }
  | rand '(' int ')' { CRand $3 }


SenseDir :: { SenseDir }
  : ahead       { Ahead }
  | here        { Here }
  | leftAhead   { LeftAhead }
  | rightAhead  { RightAhead }

Flag :: { Flag }
  : friend         { Friend        }
  | foe            { Foe           }
  | friendWithFood { FriendWithFood }
  | foeWithFood    { FoeWithFood   }
  | rock           { Rock          }
  | food           { Food          }
  | marker         { Marker $1     }
  | foeMarker      { FoeMarker     }
  | home           { Home          }
  | foeHome        { FoeHome       }

Dir :: { Dir }
  : left  { DLeft }
  | right { DRight }

{
parseError :: ([Token], [String]) -> a
parseError (tk, tks) = unsafePerformIO $ do
  putStrLn $ "Got: " ++ show tk ++ "\nExpexted: " ++ show tks
  exitFailure
}
