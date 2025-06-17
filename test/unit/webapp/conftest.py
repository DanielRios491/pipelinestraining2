import pytest
from restApp import app


@pytest.fixture
def client():
    """Configures the app for testing

    Sets app config variable ``TESTING`` to ``True``

    We dont need redis to be available, as we are going to mock it in the unit tests

    :return: App for testing
    """

    app.config['TESTING'] = True
    client = app.test_client()

    yield client
