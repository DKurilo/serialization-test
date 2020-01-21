module Main where

import           Lib       (fastPipe)
import           System.IO (stdout)

main :: IO ()
main = fastPipe stdout 45845948954 -- 9223372036854775802
