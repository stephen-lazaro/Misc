module Main (
	main
	) where

import SimpleJSON
import PutJSON

main = print $ renderJSON $ JObj [("Foo", JInt 56789), ("Bar", JBool True)]