*** Settings ***
Documentation    to login
Resource    ../Config/Setup.robot
Resource    ../TestData/login.robot
Resource    ../Objects/AccountCredential/LoginCredential.robot

*** Keywords ***
LoginApplication
   maximize browser window
   wait until element is visible    ${login_button}
   click link   ${login_button}
   wait until element is visible    ${email}
   input text   ${email}    ${email}
   wait until element is visible    ${password}
   input text   ${password}    ${passsword}
   wait until element is visible    ${login_button_2}   timeout=60
   click element    ${login_button_2}