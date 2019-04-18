import Test.Hspec
import Lib

sampleProduct :: Product
sampleProduct = Product "a" 12345 20.25;

tax, tax2 :: Double
tax = 0.2
tax2 = 0.21

discount :: Double
discount = 0.15

main :: IO ()
main = hspec $ do
  describe "Lib.displayPrice" $ do
    describe "TAX" $ do
      it "reports the price of the product" $ do
        (format . price) sampleProduct `shouldBe` "20.25$"

      it "reports the taxed price of the product" $ do
        format ((1 + tax) |#| sampleProduct) `shouldBe` "24.30$"
        format ((1 + tax2) |#| sampleProduct) `shouldBe` "24.50$"

    describe "DISCOUNT" $ do
      it "reports the total price of the product, with a discount" $ do
        format ((1 + tax - discount) |#| sampleProduct) `shouldBe` "21.26$"
