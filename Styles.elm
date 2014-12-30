module Styles where

import Html (Attribute)
import Html.Attributes (style)

type alias RawStyle = List (String, String)

hiddenInput : RawStyle
hiddenInput =
    [ ("position", "absolute")
    , ("left", "-5000px")
    ]

coreText : RawStyle
coreText =
    [ ("margin", "auto") ]

mainContainer : RawStyle
mainContainer =
    [ ("display", "flex")
    , ("height", "100%")
    ]
