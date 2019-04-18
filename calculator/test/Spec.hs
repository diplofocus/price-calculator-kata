import Test.Hspec
import Lib

sampleProduct :: Product
sampleProduct = Product "The Little Prince" 12345 20.25;

tax, tax2 :: Double
tax = 0.2
tax2 = 0.21


discount :: Double
discount = 0.15
discount2 = 0

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

    describe "REPORT" $ do
      it "reports the total price of the product even when the discount is 0" $ do
        let discounted = discount |#| sampleProduct
        -- Delegated to any IO
        let report = if discounted > 0 then Just (format discounted) else Nothing

        let total = (1 + tax - discount) |#| sampleProduct
        report `shouldBe` Just "3.04$"
        format total `shouldBe` "21.26$"

      it "reports the total price of the product even when the discount is 0" $ do
        let discounted = discount2 |#| sampleProduct
        -- Delegated to any IO
        let report = if discounted > 0 then Just (format discounted) else Nothing

        let total = (1 + tax - discount2) |#| sampleProduct
        report `shouldBe` Nothing
        format total `shouldBe` "24.30$"
