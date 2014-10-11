module Main (
	main
	) where

import SimpleJSON

main = print $ JObj [("Foo", JInt 56789), ("Bar", JBool True)]