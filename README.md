# SSCCE for a bug in elm-review-unused@1.1.5

## Verification

Clone repository and run

`npm start`

## Problem

When you have the same name of type and name of variant
AND you expose the variants with (..) and the type explicitly
THEN elm-review wants the first one to be removed even though
it is used and without it the program won't compile.

```
-- ELM-REVIEW ERROR ----------------------------------------- src/Main.elm:15:26

(fix) NoUnused.Variables: Imported type `A` is not used

14| import Html exposing (Html)
15| import ModuleA exposing (A)
                             ^
16| import ModuleB exposing (Variants(..))

You should either use this value somewhere, or remove it at the location I
pointed at.

```
