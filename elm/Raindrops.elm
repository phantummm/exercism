module Raindrops exposing (..)

type alias Rule =
  (Int, String)

allRules : (List Rule)
allRules =
  [ (3, "Pling")
  , (5, "Plang")
  , (7, "Plong")
  ]

raindrops : Int -> String
raindrops input =
  translateNumber allRules input

translateNumber : List Rule -> Int -> String
translateNumber rules input =
  if divisibleByNone rules input then
    toString input
  else
    checkFactors "" rules input

checkFactors : String -> List Rule -> Int -> String
checkFactors acc rules input =
  case (List.head rules) of
    Nothing -> acc
    Just (factor, message) ->
      if (rem input factor) /= 0 then
        checkFactors acc (safeTail rules) input
      else
        checkFactors (acc ++ message) (safeTail rules) input

divisibleByNone : List Rule -> Int -> Bool
divisibleByNone rules input =
  case (List.head rules) of
    Nothing -> True
    Just (factor, _) ->
      if (rem input factor) /= 0 then
        divisibleByNone (Maybe.withDefault [] (List.tail rules)) input
      else
        False

safeTail : List Rule -> List Rule
safeTail rules =
  Maybe.withDefault [] (List.tail rules)
