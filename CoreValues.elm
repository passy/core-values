module CoreValues where

import Html (..)
import Html.Tags as H
import Html.Attributes as H
import Window

import Graphics.Input as Input

type Color = String

type State =
    { text : String
    , bgColor : Color
    , textColor : Color
    }

data Action = NoOp

defaultState : State
defaultState =
    { text = "Innovate through experimentation."
    , textColor = "#FFFFFF"
    , bgColor = "#55ACEE"
    }

main : Signal Element
main = lift2 scene state Window.dimensions

-- Stub so far, obviously.
step : Action -> State -> State
step action state =
    case action of
        NoOp -> state

scene : State -> (Int, Int) -> Element
scene state (w, h) =
    container w h midTop (toElement 550 h (view state))

actions : Input.Input Action
actions = Input.input NoOp

state : Signal State
state = foldp step defaultState actions.signal

view : State -> Html
view state =
    H.div
        [ H.class "main" ]
        [ H.h1 [] [ text state.text ] ]
