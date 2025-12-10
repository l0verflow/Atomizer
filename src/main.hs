module Main where

import Atomizer (lexer, Tokens)

main :: IO ()
main = do
    let input = "313 + 32 * (33 - 1)" -- Example
    print $ lexer input
