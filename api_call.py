import requests


def api_call():
    url = "https://openexchangerates.org/api/latest.json?app_id=bb6233d85e4b44fabfba265caa61a84b"

    r = requests.get(url)

    # print(r.text)
    return r.text
