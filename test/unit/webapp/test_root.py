from unittest.mock import patch


@patch("restApp.cache.incr")
def test_landing(mock_incr, client):
    mock_incr.return_value = 3
    landing = client.get("/")
    html = landing.data.decode()

    assert landing.status_code == 200
    assert "Hello World! I have been seen 3 times." in html
    mock_incr.assert_called_once_with("hits")
