module MovingElement exposing (Model, Msg, update, view)

import Svg exposing (Svg)
import Svg.Attributes exposing (..)


-- Model

type alias Model a =
  { a | xPos : Float
      , yPos: Float
      , width: Float
      , height: Float
      , img: String
  }


-- Update

type Msg = Tick Float

update : Float -> Model a -> Model a
update delta model =
  { model | xPos = model.xPos + scrollSpeed * delta }


-- View

view : (Float, Float) -> Model a -> Svg Msg
view (_, windowH) model =
  let (offsetX, offsetY) = (0, windowH - 100)
      xPos = offsetX + model.xPos |> toString
      yPos = offsetY - model.yPos |> toString
  in  Svg.image [ x xPos
                , y yPos
                , width <| toString model.width
                , height <| toString model.height
                , xlinkHref model.img
                ]
                []


scrollSpeed : Float
scrollSpeed = -0.4