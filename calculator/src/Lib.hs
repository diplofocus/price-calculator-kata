module Lib
  ( someFunc
  ) where

import Text.Printf (printf)

data Product = Product
  { name :: String
  , upc :: Int
  , price :: Double
  } deriving (Show)

sampleProduct :: Product
sampleProduct = Product "a" 12345 20.25;

tax :: Double
tax = 0.2

discount :: Double
discount = 0.15

(|#|) :: Double -> Product -> Double
(|#|) percentage = (*) percentage . price

format :: Double -> String
format = printf "%.2f"

someFunc :: IO ()
someFunc = do
    putStrLn $ "Base price: " ++ (format $ price sampleProduct)
    putStrLn $ "Price with tax and discount: " ++ (format $ ((1 + tax - discount) |#| sampleProduct))
