module Lib
  ( Product(..)
  , (|#|)
  , format
  ) where

import Text.Printf (printf)

data Product = Product
  { name :: String
  , upc :: Int
  , price :: Double
  } deriving (Show)


(|#|) :: Double -> Product -> Double
(|#|) percentage = (flip (.)) price $ flip (*) percentage

format :: Double -> String
format = (++ "$") . printf "%.2f"
