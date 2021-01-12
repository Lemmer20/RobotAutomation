*** Settings ***
Documentation    holds the script for product ordering
Resource    ../Config/Setup.robot
*** Variables ***


*** Test Cases ***
ProductOrdering

     click element  //ul[@class='top-menu notmobile']//a[contains(text(),'Computers')]
     sleep    1
     click element    //div[@class='picture']//a[@href='/desktops']
     sleep    1
