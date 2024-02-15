*** Settings ***
Documentation          Signup Page

Library                SeleniumLibrary

*** Keywords ***
Validate Page Logo
    Element Should Be Visible        css=img[alt="Buger Eats"]
