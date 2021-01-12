*** Settings ***
Documentation    holds the information for logging in

*** Variables ***
${login_link}   //div[@class='header-links']//a[@class='ico-login']
${input_email}    //div[@class='form-fields']//input[@id='Email']
${input_password}     //div[@class='form-fields']//input[@id='Password']
${login_button}     //div[@class='buttons']//input[@class='button-1 login-button']