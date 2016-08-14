module JsonPatch.Reverser exposing (reverseIt)

import String exposing (reverse)


reverseIt : String -> String
reverseIt str =
    reverse str
