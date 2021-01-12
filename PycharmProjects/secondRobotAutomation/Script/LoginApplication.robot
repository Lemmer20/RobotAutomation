*** Settings ***
Documentation  To Login scenario
Library     SeleniumLibrary
Resource    ../Config/Setup.robot
Resource    ../Scenario/login_scenario.robot


*** Test Cases ***
LoginTest
    To open the application
    To login the application    ${user_email}   ${user_password}
    Close browser

ForLoop
    @{item}     create list    emely gerald ronald grey
    FOR     ${i}    IN      @{item}
    log to console  ${i}
    exit for loop if    ${i}==ronald
    END




