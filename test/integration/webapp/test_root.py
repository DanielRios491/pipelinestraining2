import requests
import re


def test_landing(base_url):
    response = requests.get(f"{base_url}/")
    html = response.text

    assert response.status_code == 200

    match = re.search(r"Hello World! I have been seen (\d+) times\.", html)
    assert match is not None
    assert int(match.group(1)) > 0