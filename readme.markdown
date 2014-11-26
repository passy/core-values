# Core Values

*Really bloody early stage.* Just dabbling around with Elm.

## Running

```bash
$ cabal update
$ cabal install cabal-install
$ cabal install -j Elm-0.13 elm-repl-0.3 elm-reactor-0.1 elm-get-0.13

# Fish syntax, add some $'s for bash
$ elm-get install
$ env ELM_HOME=(dirname (elm -g)) elm-reactor -r=(elm -g)
$ open http://localhost:8000/CoreValues.elm?debug
```
