Oblivion Currency Exchange
===

Fetches and stores currency exchanges from https://openexchangerates.org

Development
---

Requires python3. Using Homebrew: `brew install python3`

Setup a [virtual environment](https://docs.python.org/3/library/venv.html) and
install the dependencies:

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install -U pip
pip install -r requirements.txt
```

To run: `python main.py`

### Dependencies

To install dependencies add them to `requirements.in` and then:

```bash
pip install -r requirements.in
pip freeze > requirements.txt
```

Deployment
---

Requires:
 - [fpm](https://github.com/jordansissel/fpm): `gem install fpm`
 - GNU tar: `brew install gnu-tar` (macOS only)

Run `make deploy` to deploy to https://oblivion.movercado.org

To deploy somewhere else use the environment variable `TO` like `make deploy TO=oblivion.movercado.dev`.

To know which version is deployed run `make deployed`. It also accepts the environment variable `TO`.
