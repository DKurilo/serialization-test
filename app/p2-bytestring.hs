module Main where

import qualified Data.Binary          as B
import qualified Data.ByteString.Lazy as BS

main :: IO ()
main = do
  dat <- BS.getContents
  print $ (B.decode dat :: Int) + 5
