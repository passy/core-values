module Styles where

import Html (Attribute)
import Html.Attributes (style)

hiddenInput : Attribute
hiddenInput = style
    [ ("position", "absolute")
    , ("left", "-5000px")
    ]
