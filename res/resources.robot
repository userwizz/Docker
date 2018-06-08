*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER}              Chrome
${SELENIUM_TIMEOUT}     15 seconds


*** Keywords ***
Open Browser And Init
    Open Browser    about:blank     ${BROWSER}
    Set Selenium Timeout    ${SELENIUM_TIMEOUT}
    Set Window Size     1920    1080

Close Browser And Clean-up
    Delete All Cookies
    Close All Browsers