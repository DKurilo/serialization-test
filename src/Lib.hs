module Lib
    ( fastPipe
    , fastUnpipe
    ) where

import           System.IO
import           Unsafe.Coerce

fastPipe :: Handle -> Int -> IO ()
fastPipe h x | x >= 0 = do hPutChar h '+'
                           fastPipe' h x
             | otherwise = do hPutChar h '-'
                              fastPipe' h ((-1) - x)

fastPipe' :: Handle -> Int -> IO ()
fastPipe' h x = do
    let (d, m) = x `divMod` 58
    (hPutChar h . (unsafeCoerce :: Int -> Char) . (+ 65)) m
    if d > 0
       then fastPipe' h d
       else hPutChar h '$'

fastUnpipe :: Handle -> IO Int
fastUnpipe h = do
    c <- hGetChar h
    x <- fastUnpipe' h 0 1
    (return . (if c == '-' then ((-1) -) else id)) x

-- I want use tail recursion, so I need one extra parameter here
fastUnpipe' :: Handle -> Int -> Int -> IO Int
fastUnpipe' h x m =  do
    c <- hGetChar h
    if c == '$'
       then return x
       else fastUnpipe' h (x + ((\y -> (y - 65) * m) . (unsafeCoerce :: Char -> Int)) c) (58 * m)
