*** Settings ***
Documentation    To login
Resource    ../Config/Setup.robot
Resource    ../Scenario/Login.robot

*** Test Cases ***
LoginTest
   open browser     ${url}   ${browser}
   LoginApplication
   close browser



