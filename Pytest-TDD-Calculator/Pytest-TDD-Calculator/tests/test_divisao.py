import pytest
from main.calculadora import Calculadora

@pytest.fixture


def calculadora():
    return Calculadora()
@pytest.mark.divisao
def test_divisao(calculadora):
    assert calculadora.divisao(10, 2) == 5 
@pytest.mark.divisaoZero
def test_divisaoZero(calculadora):
    with pytest.raises(ZeroDivisionError):
        calculadora.divisao(10, 0)

def test_divisaoZero(calculadora):
    with pytest.raises(ZeroDivisionError) as exec_info :
        calculadora.divisao(10, 0)
    assert "Não é possível dividir por zero." in str(exec_info)

@pytest.mark.divisaoDecimal
def test_divisaoDecimal(calculadora):
    assert calculadora.divisao(5, 2) == 2.5