*** Settings ***
Documentation          Signup Page

Library                SeleniumLibrary
Library                FakerLibrary        locale=pt_BR

Library                ${EXECDIR}/resources/libs/cpf_creator.py

*** Keywords ***
Start Registration
    Click Element      css=a[href="/deliver"]

    Wait Until Location Contains        /deliver      timeout=15

    Wait Until Element Contains         css=h1        Cadastre-se

Click On Search CEP Button
    Click Element      css=input[type=button][value="Buscar CEP"]

Fill Form
    [Arguments]       ${CPF}=           ${EMAIL}=        ${WHATSAPP}=        ${CEP}=14870810

    IF    $CPF in ['${EMPTY}', '${null}']
        ${CPF}             Generate Cpf
    END

    IF    $EMAIL in ['${EMPTY}', '${null}']
        ${EMAIL}           FakerLibrary.Email
    END

    IF    $WHATSAPP in ['${EMPTY}', '${null}']
        ${WHATSAPP}        FakerLibrary.Phone Number
    END

    ${NOME_COMPLETO}   FakerLibrary.Name Male    
    ${NUMERO}          FakerLibrary.Building Number

    Input Text         css=input[placeholder="Nome completo"]          ${NOME_COMPLETO}
    Input Text         css=input[placeholder="CPF somente números"]    ${CPF}
    Input Text         css=input[placeholder="E-mail"]                 ${EMAIL}
    Input Text         css=input[placeholder="Whatsapp"]               ${WHATSAPP}
    Input Text         css=input[name="postalcode"]                    ${CEP}

    Click On Search CEP Button

    Input Text         css=input[name="address-number"]                ${NUMERO}

Select Vehicle Type
    [Arguments]        ${vehicle_type}

    Click Element      css=.delivery-method li img[alt="${vehicle_type}"]

Upload CNH
    Choose File        css=input[type="file"]        ${EXECDIR}/fixtures/cnh-digital.jpg

Submit Signup Form
    Click Element      css=button[class="button-success"]

Modal Message Should Be
    [Arguments]               ${expected_message}

    Element Text Should Be    css=#swal2-html-container      ${expected_message}

    Capture Page Screenshot

Alert Message Should Be
    [Arguments]               ${expected_message}

    ${element}                Set Variable        xpath=//span[@class="alert-error"][text()="${expected_message}"]

    Element Should Be Visible        ${element}
    Capture Element Screenshot       ${element}