module Main (
	main
	) where

import SimpleJSON
import PutJSON

main = putJSON $ JObj [("Foo", JInt 56789), ("Bar", JBool True)]