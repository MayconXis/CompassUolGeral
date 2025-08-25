import pytest
from main.calculadora import Calculadora

@pytest.fixture
def calculadora():
    return Calculadora()
@pytest.mark.multiplicacao
def test_divisao(calculadora):
    assert calculadora.multiplicacao(5, 2) == 10