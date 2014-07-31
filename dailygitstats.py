import sys
import urllib
import json
import datetime as dtime

today_began = str(dtime.date.today) + "T80:00:00Z"
#GitHub's api returns extra characters that screw up the JSON module's loading stuff
def clean(given_string):
    first_json = min(index('['), index('{'))
    last_json = min()
    return given_string[first_json:last_json]

def pair_sum(list_of_dicts, key1, key2):
    rez = [0, 0]
    for pair in list_of_dicts:
        rez[0] += pair[key1]
        rez[1] += pair[key2]
    return rez
#Run through the repositories to get data on changes
counts = []
acc = 0
for reposit in ['Ruby', 'Python', 'OCaml', 'Haskell', 'Scala', 'Elliptic']:
    counts.append({reposit : []})
    with urllib.urlopen('http://api.github.com/reps/Vassah/'+reposit+'/commits?since='+today_began) as connecticus:
        content = connecticus.read()
        content = clean(connecticus)
        content = json.loads(content)
        shas = []
        for commit in content:
            shas.append(commit['sha'])
    for shax in shas:
        with urllib.urlopen('http://api.github.com/reps/Vassah/'+reposit+'/commits/'+shax) as commitzy:
            content = commitzy.read()
            content = clean(content)
            content = json.loads(content)
            statsy = content['stats']
            counts[reposit].append({'adds' : statsy['additions'], 'dels' : stats['deletions'])
    acc = acc + pair_sum(counts[reposit], 'adds', 'dels)
