*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out the shopping cart
  [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    wait until page contains  Sell
    sleep  3s
    click element  xpath=//*[@id="nav-cart"]/span[3]
    wait until page contains  Shopping Cart
    capture page screenshot  Screenshots/shoppingcart.png

    Close Browser
*** Keywords ***
