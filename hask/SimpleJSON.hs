module SimpleJSON
    (
       JValue(..)
       ,getString
       ,getInt
       ,getDouble
       ,getBool
       ,getObject
       ,getArray
       ,isNull
       )  where
data JValue = JString String
			|JInt Int
			|JDouble Double
			|JBool Bool
			|JObj [(String, JValue)]
			|JArray [JValue]
			deriving (Eq, Ord, Show)

getString :: JValue -> Maybe String
getString (JString s) = Just s
getString _ = Nothing

getInt :: JValue -> Maybe Int
getInt (JInt i) = Just i
getInt _ = Nothing

getDouble :: JValue -> Maybe Double
getDouble (JDouble d) = Just d
getDouble _ = Nothing

getBool :: JValue -> Maybe Bool
getBool (JBool b) = Just b
getBool _ = Nothing

getObject :: JValue -> Maybe [(String, JValue)]
getObject (JObj o) = Just o
getObject _ = Nothing

getArray :: JValue -> Maybe [JValue]
getArray (JArray a) = Just a
getArray _ = Nothing

isNull :: JValue -> Bool
isNull _ = False