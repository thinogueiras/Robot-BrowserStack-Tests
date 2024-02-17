*** Settings ***
Documentation          Arquivo principal do projeto

Library                SeleniumLibrary

Resource               pages/HomePage.robot
Resource               pages/SignupPage.robot

*** Variables ***
${BASE_URL}            https://buger-eats-qa.vercel.app
${BROWSER}             chrome

*** Keywords ***
Start Test
    Open Browser       url=${BASE_URL}
    ...                browser=${BROWSER}

    Set Selenium Implicit Wait    15

Finish Test
    Close Browser