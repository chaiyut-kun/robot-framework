*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BASE_URL}        https://robot-lab-five.vercel.app/
${BROWSER}         chrome
${VALID_PASSWORD}  123
${FIRST_NAME}      B
${LAST_NAME}       T
${email}           nk@s.com

# *** Keywords ***
# Generate New Email
#     ${rand}=    Generate Random String    6    [LOWER]
#     ${NEW_EMAIL}=    Set Variable    testuser_${rand}@gmail.com
#     [Return]    ${NEW_EMAIL}
    
*** Test Cases ***
Open Browser

    # สร้าง chrome profile สำหรับ debug ใช้ port 9222
    Open Browser  ${BASE_URL}  chrome  options=add_experimental_option("debuggerAddress", "127.0.0.1:9222")
    Sleep   30s
    Maximize Browser Window

Click Register Button
    Wait Until Element Is Visible  css:.nav-btn-register    10s
    Click Element    css:.nav-btn-register
    Sleep    3s
    Input Text  id=firstName    ${FIRST_NAME}
    Sleep   2s
    Input Text  id=lastName     ${LAST_NAME}
    Sleep   2s
    # ${email}=    Generate New Email
    Input Text  id=email     ${email}
    Sleep   2s
    Input Text  id=password   ${VALID_PASSWORD}
    Sleep   2s
    Click Element    xpath=//button[@type='submit']
    Sleep   6s
    
    

Click Login Button

    # Click Element    xpath=//button[@class='nav-btn-login']
    Wait Until Element Is Visible    css:.nav-btn-login    10s
    Click Element                   css:.nav-btn-login

    Sleep   5s
    Input Text  id=loginEmail     ${email}
    Sleep   2s
    Input Text  id=loginPassword   ${VALID_PASSWORD}
    Sleep   5s
    # Wait Until Element Is Visible  xpath=//button[@type='submit']    5s
    Click Element    xpath=//button[@type='submit'] 
    # wait until login is successful
    Sleep   20s
    # click refresh page
    Go Back
    Sleep     10s
    Click Element    xpath=//button[contains(@class,'nav-btn-login')]
    Sleep   3s
    Input Text  id=loginEmail     ${email}
    Sleep   2s
    Input Text  id=loginPassword   ${VALID_PASSWORD}
    Sleep   5s
    # Wait Until Element Is Visible  xpath=//button[@type='submit']    5s
    Click Element    xpath=//button[@type='submit'] 
    # wait until login is successful
    # Wait Until Element Is Visible    xpath=//h1[contains(., "Welcome")]    20s
    Sleep   30s

# Into Dashboard