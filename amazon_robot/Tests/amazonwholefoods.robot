*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***


*** Test Cases ***
User doesn't have to sign in to check out the "Whole Foods", option
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    wait until page contains  Whole Foods
    click link  Whole Foods
    sleep  3s

   page should contain  Your recently viewed items and featured recommendations
   wait until page contains element  id=navFooter
   # page should contain image  alt=Holiday deals for everyone

    capture page screenshot  Screenshots/wholefoods_on_amazon.png

    Close Browser
*** Keywords ***
