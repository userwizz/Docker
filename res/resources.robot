*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}              Firefox
${SELENIUM_TIMEOUT}     15 seconds


*** Keywords ***
Open Browser And Init
    Open Browser    about:blank     ${BROWSER}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Maximize Browser Window

Close Browser And Clean-up
    Delete All Cookies
    Close All Browsers
