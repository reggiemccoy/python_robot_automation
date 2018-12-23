*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User doesn't have to sign in to check out the "Sell", option
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    wait until page contains  Sell
    click link  Sell
    wait until page contains  Find the right Amazon solution for your business
    capture page screenshot  Screenshots/sell_on_amazon.png

    Close Browser
*** Keywords ***
