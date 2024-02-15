*** Settings ***
Documentation           Testes na Home Page

Resource                ../resources/base.resource

Test Setup              Start Test
Test Teardown           Finish Test

*** Test Cases ***
Deve validar o título da página inicial
    Title Should Be             Buger Eats

Deve validar o logo Buger Eats
    Validate Page Logo

Deve validar o texto do cabeçalho
    Page Should Contain         Seja um parceiro entregador pela Buger Eats

Deve validar o texto central
    Page Should Contain         Em vez de oportunidades tradicionais de entrega de refeições em horários pouco flexíveis, seja seu próprio chefe.