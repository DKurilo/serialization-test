module Main where

import           Lib       (fastUnpipe)
import           System.IO (stdin)

main :: IO ()
main = (+5) <$> fastUnpipe stdin >>= print
