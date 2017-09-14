module Pangram exposing (..)

import String exposing (toList, toLower)
import List exposing (member, all)


allLetters : List Char
allLetters =
    toList "abcdefghijklmnopqrstuvwxyz"


isPangram : String -> Bool
isPangram input =
    let
        nInput =
            input
                |> toLower
                |> toList
    in
        all (\c -> member c nInput) allLetters
