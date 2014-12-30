module CoreValues where

import Color as C
import Debug
import Html as H
import Html.Attributes as H
import Html.Events as H
import List
import Signal
import String
import Styles
import Window

import Graphics.Input as Input
import Graphics.Element (Element, color, container, midTop)

type alias State =
    { text : String
    , bgColor : C.Color
    , textColor : C.Color
    }

type Update
    = NoOp
    | ChangeField String
    | FocusField

defaultState : State
defaultState =
    { text = "Innovate through experimentation."
    , textColor = C.white
    , bgColor = C.rgb 85 172 238
    }

main : Signal Element
main = Signal.map2 scene state Window.dimensions

-- Stub so far, obviously.
step : Update -> State -> State
step update state =
    case update of
        ChangeField str ->
            { state | text <- str }
        FocusField ->
            -- Umm, how do I issue an action from here?
            { state | text <- "hi" }
        _ -> state

scene : State -> (Int, Int) -> Element
scene state (w, h) =
    color state.bgColor <| container w h midTop <| H.toElement 550 h <| view state

state : Signal State
state = Signal.foldp step defaultState <| Signal.subscribe updates

updates : Signal.Channel Update
updates = Signal.channel NoOp

colorToCSS : C.Color -> String
colorToCSS c =
    let
        rgb = C.toRgb c
        rgbList = [rgb.red, rgb.green, rgb.blue]
    in
        "rgb(" ++ (String.join ", " <| List.map toString <| rgbList) ++ ")"

view : State -> H.Html
view state =
    H.div
        [ H.class "main"
        , H.onClick (Signal.send updates FocusField)
        ]
        [ H.h1
            [ H.style [ ("color", colorToCSS state.textColor) ] ]
            [ H.text state.text ]
        , H.input
            [ H.value state.text
            , H.autofocus True
            , Styles.hiddenInput
            , H.on "input" H.targetValue (Signal.send updates << ChangeField)
            ] []
        ]
