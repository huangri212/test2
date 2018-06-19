*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         qa.dxc-apa.net
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     admin1@dxc.com
${VALID PASSWORD}    password
${LOGIN URL}      http://${SERVER}/passport/login
${WELCOME URL}    http://${SERVER}
${ERROR URL}      http://${SERVER}/error.html
*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be  Agile Process Automation  

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id:loginEmail    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:loginPassword    ${password}

Submit Credentials
    Click Button    id:loginButton
    Set Selenium Implicit Wait    5 
Welcome Page Should Be Open
    #Textarea Value Should Be    xpath: //span[@class="greeting-user"]    admin1 apa
    Element Text Should Be    tag:small    Good day,