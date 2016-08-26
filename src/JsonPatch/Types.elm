module JsonPatch.Types exposing (..)


type alias Op =
    String


type alias Path =
    String


type alias Value =
    Int


type alias Operation =
    { op : Op
    , path : Path
    , value : Value
    }


type alias Patch =
    List Operation
