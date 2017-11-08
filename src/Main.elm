import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

type alias Model =
    { op1 : Int,
      op2: Int,
      result: Int
    }

type Msg = Add | ChangeOp1 String | ChangeOp2 String

main: Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }

init : (Model, Cmd Msg)
init =
    (Model 0 0 0, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        ChangeOp1 newValue ->
            ({ model | op1 = String.toInt newValue |> Result.toMaybe |> Maybe.withDefault 0 }, Cmd.none)
        ChangeOp2 newValue ->
            ({ model | op2 = String.toInt newValue |> Result.toMaybe |> Maybe.withDefault 0 }, Cmd.none)
        Add ->
            ({ model | result = model.op1 + model.op2 }, Cmd.none)

view : Model -> Html Msg
view model =
    div [] [
        input [onInput ChangeOp1] [],
        text "+",
        input [onInput ChangeOp2] [],
        text "=",
        strong [] [text (toString model.result)],
        button [onClick Add] [text "Add"]
    ]
