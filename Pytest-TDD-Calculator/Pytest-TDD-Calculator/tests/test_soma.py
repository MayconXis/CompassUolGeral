import pytest
from main.calculadora import Calculadora

@pytest.fixture
def calculadora():
    return Calculadora()
@pytest.mark.soma
def test_soma(calculadora):
    assert calculadora.soma(2, 3) == 5