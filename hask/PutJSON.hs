module PutJSON (
	renderJSON) where

import SimpleJSON
import Data.List

renderJSON (JString s) = s
renderJSON (JInt i) = show i
renderJSON (JDouble d) = show d
renderJSON (JBool True) = "true"
renderJSON (JBool False) = "false"
renderJSON (JArray j) = "[" ++ values j ++ "]"
    where values [] = ""
          values j  = Data.List.intercalate ", " $ map renderJSON j


renderJSON (JObj obj) = "{" ++ values obj ++ "}"
    where values [] = ""
          values lz = Data.List.intercalate ", " $ map renderPair lz
              where renderPair (key, value) = key ++ " : " ++ renderJSON value