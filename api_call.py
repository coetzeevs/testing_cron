import urllib3


def api_call():
    url = "https://openexchangerates.org/api/latest.json?app_id=bb6233d85e4b44fabfba265caa61a84b"
    http = urllib3.PoolManager()
    r = http.request('GET', url)

    return str(r.data)
