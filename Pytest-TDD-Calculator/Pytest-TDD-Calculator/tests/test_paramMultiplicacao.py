import pytest
from main.calculadora import Calculadora

# Esses testes parametrizados para a função soma foram realizados para aprendizado com base no curso da udemy, 
# tendo o mesmo valor dos outros testes não parametizados

@pytest.mark.parametrize("a, b, resultado_esperado", [
    (4, 5, 20),         
    (10, 0, 0),         
    (-2, 5, -10),       
    (-3, -3, 9)         
])
@pytest.mark.multiplicacaoParam
def test_multiplicacao(a, b, resultado_esperado):
    calculadora = Calculadora()
    assert calculadora.multiplicacao(a, b) == resultado_esperado
