{-#LANGUAGE ScopedTypeVariables#-}

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

format :: Double -> String
format = printf "%.2f"

someFunc :: IO ()
someFunc = do
    putStrLn $ "Price before tax: " ++ (format $ price sampleProduct)
    putStrLn $ "Price before tax: " ++ (format $ (price sampleProduct * (1 + tax)))
