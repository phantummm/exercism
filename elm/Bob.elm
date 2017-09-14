module Bob exposing (..)

import Regex exposing (regex, replace)
import Char exposing (isUpper, isLower)


type StatementType
  = Question
  | Shout
  | Silence
  | Other

type alias StatementTest =
  String -> Bool

type alias Statement =
  (StatementType, StatementTest)



allStatements : (List Statement)
allStatements =
  [ (Silence, \(x) -> String.isEmpty <| String.trim x)
  , (Shout, \(x) -> (String.toUpper x) == x && hasLetters x)
  , (Question, \(x) -> (String.right 1 x) == "?")
  ]


hey : String -> String
hey input =
  let
    statementType = testInput (filterInput input) allStatements
  in
    case statementType of
      Question -> "Sure."
      Shout -> "Whoa, chill out!"
      Silence -> "Fine. Be that way!"
      Other -> "Whatever."


testInput : String -> List Statement -> StatementType
testInput input statements =
  case (List.head statements) of
    Nothing -> Other
    Just (statementType, statementTest) ->
      if (statementTest input) then
        statementType
      else
        testInput input (Maybe.withDefault [] (List.tail statements))


filterInput : String -> String
filterInput input =
  replace Regex.All (regex "[0-9]") (\_ -> "") input


hasLetters : String -> Bool
hasLetters input =
  let
    justLetters = String.filter (\x -> isUpper x || isLower x) input
  in
    (String.length justLetters) > 0
