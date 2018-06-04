module RomanNumbers (isValidRoman, isValidArab, romanToArab, arabToRoman) where

import           Control.Monad   (sequence)
import           Data.List       (group)
import           Data.List.Split (chunksOf)
import qualified Data.Map        as M
import           Text.Regex.TDFA ((=~))

isValidRoman :: String -> Bool
isValidRoman s = s /= "" && s =~ "^M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$" :: Bool

isValidArab :: Int -> Bool
isValidArab n = n > 0 && n < 4000

romanToArab :: String -> (Maybe Int)
romanToArab n
    | isValidRoman n = ((fmap sum . sequence) . flatBy pairCalc . chunksOf 2 . reverse . flatBy sum . group . transl) n
    | otherwise = Nothing
    where
        pairCalc xs = if head xs > last xs then subtract (last xs) (head xs) else sum xs
        transl xs = map (\x -> M.lookup x (M.fromList [('I',1),('V',5),('X',10),('L',50),('C',100),('D',500),('M',1000)])) xs
        flatBy fn xs = map (fmap fn . sequence) xs

arabToRoman :: Int -> (Maybe String)
arabToRoman n = if isValidArab n then do
                    s <- Just((trans . prepareAsStr) n)
                    return s
                else Nothing
                where
                    trans s = r where
                        m = ["","M","MM","MMM"]!!(s!!0)
                        h = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]!!(s!!1)
                        t = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]!!(s!!2)
                        u = ["","I","II","III","IV","V","VI","VII","VIII","IX"]!!(s!!3)
                        r = m ++ h ++ t ++ u
                    strToIntList n = map (read . (:"")) n :: [Int]
                    prepareAsStr = strToIntList . (reverse . take 4 . reverse) . (\n -> "0000"++n) . show
