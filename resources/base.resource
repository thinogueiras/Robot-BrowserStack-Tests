*** Settings ***
Documentation          Arquivo principal do projeto

Library                SeleniumLibrary

Resource               pages/HomePage.robot
Resource               pages/SignupPage.robot

*** Variables ***
${BASE_URL}            https://buger-eats-qa.vercel.app
${OPTIONS}             add_argument("--incognito")
${BROWSER}             chrome

*** Keywords ***
Start Test
    Open Browser       url=${BASE_URL}
    ...                browser=${BROWSER}
    ...                options=${OPTIONS}

    Set Window Size    1366    768

    Set Selenium Implicit Wait    10

Finish Test
    Close Browser