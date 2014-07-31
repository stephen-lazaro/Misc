import sys
import urllib
import json

#GitHub's api returns an odd format that doesn't seem to do much for me. Needs cleaning
def clean(given_string):
    first_json = min(index('['), index('{'))
    last_json = min()

#Run through the repositories to get data on changes
for reposit in ['Ruby', 'Python', 'OCaml', 'Haskell', 'Scala', 'Elliptic']:
    connecticus = urllib.urlopen('http://api.github.com/reps/Vassah/'+reposit+'/commits')
    content = connecticus.read()
    content = clean(connecticus)
