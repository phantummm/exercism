-- Learned how to do much cleaner head/tail splitting from mrwest808's example
-- http://exercism.io/submissions/007a61133d374c9d8f63c2ac5ac5bfce


module Accumulate exposing (..)


accumulate : (a -> a) -> List a -> List a
accumulate fn list =
    case list of
        [] ->
            []

        h :: t ->
            (fn h) :: (accumulate fn t)
