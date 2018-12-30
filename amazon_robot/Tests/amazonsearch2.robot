*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
Verify the homepage navigation button
  [Documentation]  The following test cases verifies homepage button is present
    [Tags]  Smoke

    Begin Web Test (common)
    Navigate to URL




    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    # Open Browser  http://www.amazon.com  chrome
    # Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    capture page screenshot  Screenshots/ferrari_458.png
    close browser



*** Keywords ***

Begin Web Test (common)
    Open Browser  about:blank  chrome


Navigate to URL
    go to  http://www.amazon.com
     wait until page contains element  id=nav-your-amazon

