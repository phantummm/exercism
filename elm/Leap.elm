module Leap exposing (..)

isLeapYear : Int -> Bool
isLeapYear year =
  if (evenlyDivisibleBy year 4) then
    fourHundredCorrection year
  else
    False

evenlyDivisibleBy : Int -> Int -> Bool
evenlyDivisibleBy numerator denominator =
  (rem numerator denominator) == 0

fourHundredCorrection : Int -> Bool
fourHundredCorrection year =
  if not (evenlyDivisibleBy year 100) then
    True
  else
    evenlyDivisibleBy year 400
