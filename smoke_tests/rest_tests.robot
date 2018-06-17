*** Settings ***
Resource    ../res/resources.robot

Suite Setup    Create a new HTTP session
Suite Teardown    Delete All Sessions


*** Test Cases ***
Response code using valid request
    ${response}    Get Request    ${ALIAS}      /
    Should Be Equal As Strings    ${response.status_code}    200

Verify MIME data type (JSON)
    ${response}    Head Request    ${ALIAS}     /
    Should Be Equal As Strings  ${response.status_code}  200
    Should Contain    ${response.headers.get("content-type")}	json

Verify attribute from JSON payload
    ${response}    Get Request    ${ALIAS}    /
    ${json_data}    Parse Json    ${response.content}
    Should Be Equal    ${json_data["users"][0]["name"]}    foo
