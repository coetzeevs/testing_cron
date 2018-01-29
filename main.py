import pandas as pd
from api_call import *
import json

data = api_call()

d = pd.read_json(json.dumps(json.loads(data)))
d['currency'] = d.index
d.index = range(0, len(d))

print(d)
