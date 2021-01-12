*** Settings ***
Documentation    login scenario



Resource    ../Config/Setup.robot
Resource    ../Objects/AccountLogin_Objects.robot
Resource    ../TestData/LoginCredentials.robot


*** Keywords ***
To open the application
    open browser    ${url}   ${browser}

To login the application
    [Arguments]   ${user_email}   ${user_password}
    maximize browser window
    sleep    1
    click link  ${login_link}
    sleep   2
    input text    ${input_email}   text=${user_email}
    input text    ${input_password}    text=${user_password}
    click element    ${login_button}