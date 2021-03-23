module Main exposing (main)

{-| SSCCE for elm-review-unused 1.1.15

Problem:
When you have the same name of type and name of variant
AND you expose the variants with (..) and the type explicitly
THEN elm-review wants the first one to be removed even though
it is used and without it the program won't compile

-}

import Browser
import Html exposing (Html)
import ModuleA exposing (A)
import ModuleB exposing (Variants(..))


type alias Model =
    { variants : List Variants
    , value : A
    }


init : Model
init =
    { variants = [ ModuleB.A, ModuleB.B "B" ]
    , value = { value = "value" }
    }


viewVariant : Variants -> Html ()
viewVariant variant =
    case variant of
        ModuleB.A ->
            Html.text "default"

        B str ->
            Html.text str


view : Model -> Html ()
view { variants } =
    variants
        |> List.map viewVariant
        |> Html.p []


main : Program () Model ()
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = \_ _ -> init
        }
