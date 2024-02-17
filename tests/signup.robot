*** Settings ***
Documentation           Testes de cadastro de usuários

Default Tags            signup

Resource                ../resources/base.resource

Test Setup              Run Keywords    Start Test    AND    Start Registration
Test Teardown           Finish Test

*** Test Cases ***
Deve registrar o usuário como entregador
    [Tags]                     ignore-bs

    Fill Form
    Select Vehicle Type        Moto
    Upload CNH
    Submit Signup Form

    Modal Message Should Be    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.

Deve validar CPF inválido
    Fill Form                  CPF=x0000000AA3
    Submit Signup Form

    Alert Message Should Be    Oops! CPF inválido

Deve validar E-mail inválido
    Fill Form                  EMAIL=@test.com.br
    Submit Signup Form

    Alert Message Should Be    Oops! Email com formato inválido.

Deve validar Whatsapp inválido
    Fill Form                  WHATSAPP=11@@999!!!
    Submit Signup Form

    Alert Message Should Be    Oops! Whatsapp com formato incorreto

Deve validar CEP inválido
    Fill Form                  CEP=123abc

    Click On Search CEP Button

    Alert Message Should Be    Informe um CEP válido

Deve validar os campos obrigatórios
    [Tags]                     signup    required-fields

    ${messages}                Create Dictionary
    ...                        nome=É necessário informar o nome
    ...                        cpf=É necessário informar o CPF
    ...                        email=É necessário informar o email
    ...                        cep=É necessário informar o CEP
    ...                        numero=É necessário informar o número do endereço
    ...                        delivery_method=Selecione o método de entrega
    ...                        cnh=Adicione uma foto da sua CNH

    Submit Signup Form

    FOR    ${msg}    IN    @{messages.values()}
        Alert Message Should Be       ${msg}
    END