*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    HttpLibrary.HTTP


*** Variables ***
${BROWSER}              Firefox
${SELENIUM_TIMEOUT}     15 seconds
${ALIAS}                rest_test
${BASE_URL}             http://localhost:5001

*** Keywords ***
Open Browser And Init
    Open Browser    about:blank     ${BROWSER}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Maximize Browser Window

Close Browser And Clean-up
    Delete All Cookies
    Close All Browsers

*** Keywords ***
Create a new HTTP session
    Create Session    ${ALIAS}    ${BASE_URL}
