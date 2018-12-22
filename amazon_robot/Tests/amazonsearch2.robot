*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out "Amazon search test 2"
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  COWIN E7
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains   "COWIN E7"
    wait until page contains  COWIN E7
   click element  xpath=//*[@id="result_0"]/div/div/div/div[1]/div/div/a/img

    Close Browser

*** Keywords ***
