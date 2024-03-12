*** Settings ***
Documentation          Arquivo principal do projeto

Library                SeleniumLibrary

Resource               pages/HomePage.robot
Resource               pages/SignupPage.robot

*** Variables ***
${BROWSER}             chrome

*** Keywords ***
Start Test
    Open Browser       url=https://buger-eats-qa.vercel.app
    ...                browser=${BROWSER}

    Set Selenium Implicit Wait    15

Finish Test
    Close Browser