*** Settings ***
Documentation     This are the list of all libraries needed to automate this project
Library           Selenium2Library
Library           String
Library           Collections

*** Variables ***
#Test Environment Variables
${test_envi}      https://www.amazon.com/
${browser}        Chrome
