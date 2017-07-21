module Main exposing (..)

import Html exposing (div, button, text)
import Html.Events exposing (onClick)


main : Program Never Model Action
main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }


type alias Model =
    Int


initialModel : Model
initialModel =
    0


view : Model -> Html.Html Action
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model) ]
        , button [ onClick Increment ] [ text "+" ]
        ]


type Action
    = Increment
    | Decrement


update : Action -> Model -> ( Model, Cmd msg )
update action model =
    case action of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )
