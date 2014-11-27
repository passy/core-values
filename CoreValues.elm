module CoreValues where

import Html (..)
import Html.Tags as H
import Html.Attributes as H
import Window
import Debug

import Graphics.Input as Input

type Color = String

type State =
    { text : String
    , bgColor : Color
    , textColor : Color
    }

data Update
    = NoOp
    | ChangeField String

defaultState : State
defaultState =
    { text = "Innovate through experimentation."
    , textColor = "#FFFFFF"
    , bgColor = "#55ACEE"
    }

main : Signal Element
main = lift2 scene state Window.dimensions

-- Stub so far, obviously.
step : Update -> State -> State
step update state =
    case update of
        NoOp -> state
        ChangeField str ->
            { state | text <- str }

scene : State -> (Int, Int) -> Element
scene state (w, h) =
    container w h midTop <| toElement 550 h <| view state

state : Signal State
state = foldp step defaultState updates.signal

updates : Input.Input Update
updates = Input.input NoOp

view : State -> Html
view state =
    H.div
        [ H.class "main" ]
        [ H.h1 [] [ text state.text ]
        , H.input
            [ H.value state.text
            , H.autofocus True
            , on "input" getValue updates.handle ChangeField
            ] []
        ]
