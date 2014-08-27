len [] acc = acc
len (x:xs) acc = len xs (1 + acc)