module CoreValues where

main : Element
main = flow down sentences

sentences : [Element]
sentences =
    let msg = "\nThe quick brown fox jumps over the lazy dog.\n"
        sentence tfs = leftAligned (typeface tfs (toText msg))
    in
        map sentence
        [ ["times new roman"]
        , ["helvetica", "sans-serif"]
        , ["georgia", "serif"]
        , ["trebuchet ms", "sans-serif"]
        , ["inconsolata", "courier new", "monospace"]
        ]
