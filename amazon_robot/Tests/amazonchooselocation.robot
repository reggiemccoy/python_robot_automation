*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***


*** Test Cases ***
User doesn't have to sign in to set a location
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    wait until page contains  Sell
    click element  id=glow-ingress-line1
    wait until page contains  Choose your location
    capture page screenshot  Screenshots/choose_location_amazon.png

    Close Browser
*** Keywords ***
