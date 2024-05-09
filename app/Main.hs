{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use void" #-}

module Main where

mGetLine :: IO [Char]
mGetLine = getChar >>= \c ->
          if c == '\n' then
            return []
          else
            mGetLine >>= \cs ->
            return (c:cs)

mPutLine :: [Char] -> IO ()
mPutLine [] = putChar '\n' >> return ()
mPutLine (x:xs) = putChar x >> mPutLine xs


main :: IO ()
main = mGetLine >>= mPutLine
