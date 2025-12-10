module Atomizer 
    ( Tokens(..) 
    , lexer
    ) where
import Data.Char (isDigit, isSpace)

data Tokens
  = TInt Int
  | Add | Sub
  | Mul | Div
  | LParen
  | RParen
  deriving (Show, Eq)

lexer :: String -> [Tokens]
lexer [] = []
lexer s@(c:cs)
  | isSpace c = lexer cs
  | isDigit c =         -- Capturate nums
      let (numStr, rest) = span isDigit s
      in TInt (read numStr) : lexer rest
  | otherwise = case c of
      '+' -> Add    : lexer cs
      '-' -> Sub    : lexer cs
      '*' -> Mul    : lexer cs
      '/' -> Div    : lexer cs
      '(' -> LParen : lexer cs
      ')' -> RParen : lexer cs
      _   -> error $ "Invalid char: " ++ [c]
