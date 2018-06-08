*** Settings ***
Resource    ../res/resources.robot

Suite Setup       Open Browser And Init
Suite Teardown    Close Browser And Clean-up


*** Test Cases ***
Verify google search result
    [Documentation]    Basic google search
    [Tags]    selenium
	Go To    http://google.com
	Input Text    name=q    robotFramework
	Submit Form
	Wait Until Element Is Visible    link:Robot Framework
	
