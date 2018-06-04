import Control.Exception (evaluate)
import RomanNumbers
import Test.Hspec
import Test.QuickCheck

main :: IO ()
main = hspec $ do
    describe "RomanNumbers lib" $ do

        it "[isValidRoman] Checks if roman number can be converted to arab" $ do
            isValidRoman "MMMCMXCIX" `shouldBe` (True :: Bool)
            isValidRoman "XIV" `shouldBe` (True :: Bool)
            isValidRoman "IIIX" `shouldBe` (False :: Bool)
            isValidRoman "" `shouldBe` (False :: Bool)
            isValidRoman "MMMCMM" `shouldBe` (False :: Bool)
            isValidRoman "MMMCMXCIXX" `shouldBe` (False :: Bool)
            isValidRoman "CMIVXCIXX" `shouldBe` (False :: Bool)
            isValidRoman "xiii" `shouldBe` (False :: Bool)
            isValidRoman "Xi" `shouldBe` (False :: Bool)
            isValidRoman "QA" `shouldBe` (False :: Bool)

        it "[isValidArab] Checks if arab number can be converted to roman" $ do
            isValidArab 0 `shouldBe` (False :: Bool)
            isValidArab 1 `shouldBe` (True :: Bool)
            isValidArab 3999 `shouldBe` (True :: Bool)
            isValidArab 4000 `shouldBe` (False :: Bool)

        it "[romanToArab] Converts roman number to arab number" $ do
            romanToArab "MMMCMXCIX" `shouldBe` Just 3999
            romanToArab "MMMC" `shouldBe` Just 3100
            romanToArab "CCLIV" `shouldBe` Just 254
            romanToArab "IX" `shouldBe` Just 9
            romanToArab "III" `shouldBe` Just 3
            romanToArab "QI" `shouldBe` Nothing
            romanToArab "i" `shouldBe` Nothing
            romanToArab "XM" `shouldBe` Nothing
            
        it "[arabToRoman] Converts arab number to roman number" $ do
            arabToRoman 1 `shouldBe` Just "I"
            arabToRoman 3999 `shouldBe` Just "MMMCMXCIX"
            arabToRoman 990 `shouldBe` Just "CMXC"
            arabToRoman 3100 `shouldBe` Just "MMMC"
            arabToRoman 254 `shouldBe` Just "CCLIV"
            arabToRoman 9 `shouldBe` Just "IX"
            arabToRoman 3 `shouldBe` Just "III"
            arabToRoman 0 `shouldBe` Nothing
            arabToRoman 4000 `shouldBe` Nothing
