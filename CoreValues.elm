module CoreValues where

import Html (..)
import Html.Tags as H
import Html.Attributes as H
import Html.Events as H
import Window
import Debug
import List
import Styles

import Graphics.Input as Input

type State =
    { text : String
    , bgColor : Color
    , textColor : Color
    }

data Update
    = NoOp
    | ChangeField String
    | FocusField

defaultState : State
defaultState =
    { text = "Innovate through experimentation."
    , textColor = white
    , bgColor = rgb 85 172 238
    }

main : Signal Element
main = lift2 scene state Window.dimensions

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
    color state.bgColor <| container w h midTop <| toElement 550 h <| view state

state : Signal State
state = foldp step defaultState updates.signal

updates : Input.Input Update
updates = Input.input NoOp

colorToCSS : Color -> String
colorToCSS c =
    let
        rgb = toRgb c
        rgbList = [rgb.red, rgb.green, rgb.blue]
    in
        "rgb(" ++ (List.join ", " <| List.map show <| rgbList) ++ ")"

view : State -> Html
view state =
    H.div
        [ H.class "main"
        , H.onclick updates.handle (\_ -> FocusField)
        ]
        [ H.h1
            [ style [ prop "color" <| colorToCSS state.textColor ] ]
            [ text state.text ]
        , H.input
            [ H.value state.text
            , H.autofocus True
            , style Styles.hiddenInput
            , on "input" getValue updates.handle ChangeField
            ] []
        ]
