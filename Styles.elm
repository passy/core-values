module Styles where

import Html (..)

hiddenInput : [CssProperty]
hiddenInput =
    [ prop "position" "absolute"
    , prop "left" "-5000px"
    ]
