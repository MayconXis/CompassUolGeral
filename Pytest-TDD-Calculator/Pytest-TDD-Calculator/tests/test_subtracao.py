import pytest
from main.calculadora import Calculadora

@pytest.fixture
def calculadora():
    return Calculadora()

@pytest.mark.subtracao
def test_subtracao(calculadora):
    assert calculadora.subtracao(5, 2) == 3
    