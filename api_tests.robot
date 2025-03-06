*** Settings ***
Library    RequestsLibrary
Library    Collections  # ✅ This fixes the error

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Verify User Details API
    ${response}=    GET    ${BASE_URL}/users/1
    Should Be Equal As Numbers    ${response.status_code}    200
    ${json_data}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${json_data}    name
    Dictionary Should Contain Key    ${json_data}    email
    Log    ${json_data}