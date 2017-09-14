module Triangle exposing (..)

import List exposing (any)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : Int -> Int -> Int -> Result String Triangle
triangleKind a b c =
    Ok Equilateral


validateInput : List Int -> Result String (List Int)
validateInput input =
  let
    isValid =
      (allSidesValid input) && ()
