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
    String


type alias Patch =
    String


initialState : Model
initialState =
    ""


init : ( Model, Cmd Msg )
init =
    ( initialState, displayModel "" )


type Msg
    = Receive Patch



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Receive patch ->
            ( patch, displayModel patch )


port receivePatch : (String -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    receivePatch Receive


port displayModel : String -> Cmd msg



-- VIEW (We use the worker() function in the intetration-test-port-harness.js, so the view is an unused no-op)


view : Model -> Html Msg
view _ =
    div [] []
