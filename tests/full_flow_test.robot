*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BASE_URL}        https://robot-lab-five.vercel.app/
${BROWSER}         chrome
${VALID_PASSWORD}  123
${FIRST_NAME}      B
${LAST_NAME}       T
${email}           nk@j.com

# *** Keywords ***
# Generate New Email
#     ${rand}=    Generate Random String    6    [LOWER]
#     ${NEW_EMAIL}=    Set Variable    testuser_${rand}@gmail.com
#     [Return]    ${NEW_EMAIL}
    
*** Test Cases ***
Open Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

# Click Register Button
#     Wait Until Element Is Visible  xpath=//button[contains(@class,'nav-btn-register')]    5s
#     Click Element    xpath=//button[contains(@class,'nav-btn-register')]
#     Sleep    3s
#     Input Text  id=firstName    ${FIRST_NAME}
#     Sleep   2s
#     Input Text  id=lastName     ${LAST_NAME}
#     Sleep   2s
#     # ${email}=    Generate New Email
#     Input Text  id=email     ${email}
#     Sleep   2s
#     Input Text  id=password   ${VALID_PASSWORD}
#     Sleep   2s
#     Click Element    xpath=//button[@type='submit']
#     Sleep   6s
    
    

Click Login Button
    Click Element    xpath=//button[contains(@class,'nav-btn-login')]
    Sleep   3s
    Input Text  id=loginEmail     ${email}
    Sleep   2s
    Input Text  id=loginPassword   ${VALID_PASSWORD}
    Sleep   2s
    Click Element    xpath=//button[@type='submit']
    # wait until login is successful
    Sleep   5s
    Wait Until Page Contains    Welcome    5s
    Sleep   20s

Into Dashboard