port module Test.Integration.PortParserTest exposing (..)

import Html.App as Html
import Html exposing (..)


main : Program Never
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { a : List Int
    }



--    { a : List a
--    , b :
--        { b : List a
--        }
--    }


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


initialState : Model
initialState =
    { a = []
    }


init : ( Model, Cmd Msg )
init =
    ( initialState, displayModel initialState )


type Msg
    = Receive Patch



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Receive patch ->
            let
                firstOperation =
                    case List.head patch of
                        -- TODO: How to raise error
                        Nothing ->
                            { op = "", path = "", value = -42 }

                        Just value ->
                            value
            in
                let
                    newModel =
                        { a = [ firstOperation.value ] }
                in
                    ( newModel, displayModel newModel )


port receivePatch : (List Operation -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    receivePatch Receive


port displayModel : Model -> Cmd msg



-- VIEW (We use the worker() function in the intetration-test-port-harness.js, so the view is an unused no-op)


view : Model -> Html Msg
view _ =
    div [] []
