module Main where

import qualified Data.Binary          as B
import qualified Data.ByteString.Lazy as BS

main = BS.putStr $ B.encode (45845948954 :: Int) -- (9223372036854775802 :: Int)
