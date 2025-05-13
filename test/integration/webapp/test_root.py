from test.integration.webapp import base_url
import requests


def test_landing(base_url):
    response = requests.get(f"{base_url}/")
    html = response.text

    assert response.status_code == 200
    assert "Hello World! I have been seen 1 times." in html

    response = requests.get(f"{base_url}/")
    html = response.text

    assert response.status_code == 200
    assert "Hello World! I have been seen 2 times." in html
