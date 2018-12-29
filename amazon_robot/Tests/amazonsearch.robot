*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazon.robot

*** Variables ***



*** Test Cases ***
Search for Blackmagic camera
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  blackmagic pocket cinema camera 4k
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    wait until page contains element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
    click element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
  #  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  Blackmagic Design Pocket Cinema Camera 4K
   capture page screenshot  Screenshots/blackmagic_camera.png

*** Test Cases ***
User must sign in to check out "Amazon search test"
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    # Open Browser  http://www.amazon.com  chrome
    # Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    capture page screenshot  Screenshots/ferrari_458.png

*** Test Cases ***
 Add the Ferrari to the cart
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
   Click Link  css=#result_0 > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div:nth-child(1) > a
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart
    Click Link  id=hlb-ptc-btn-native
    # Page Should Contain Element  Sign
    close browser


*** Keywords ***








