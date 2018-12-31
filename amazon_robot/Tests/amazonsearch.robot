*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***
${SEARCH_TERM} =  Ferrari 458
${SEARCH_TERM2}=  blackmagic pocket cinema camera 4k
*** Test Cases ***
Verify the homepage navigation button
  [Documentation]  The following test cases verifies homepage button is present
    [Tags]  Smoke

    Begin Web Test (common)
    Navigate to URL



*** Test Cases ***
Verify the homepage left-hand popup-menu
  [Documentation]  The following test cases verifies homepage left-hand popup-menu
    [Tags]  Smoke
   #  Open Browser  http://www.amazon.com  chrome
     wait until page contains element  id=nav-hamburger-menu
     click element  id=nav-hamburger-menu
     sleep  2s
     click element  id=hmenu-canvas-background



*** Test Cases ***
Verify the homepage account list option
  [Documentation]  The following test cases verifies homepage account list option
    [Tags]  Smoke
  #   Open Browser  http://www.amazon.com  chrome
     wait until page contains element  id=nav-link-accountList


*** Test Cases ***
Verify the homepage orders option
  [Documentation]  The following test cases verifies homepage orders option
    [Tags]  Smoke
   #  Open Browser  http://www.amazon.com  chrome
     wait until page contains element  id=nav-orders



*** Test Cases ***
Verify the user can do a blank search
  [Documentation]  Verify the user can do a blank search
    [Tags]  Regression
   #  Open Browser  http://www.amazon.com  chrome
    sleep  3s
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    location should be  https://www.amazon.com/ref=nb_sb_noss_null


*** Test Cases ***
Verify the user can do a invalid search
  [Documentation]  Verify the user can do a invalid search
    [Tags]  Regression
   #  Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  '#'

    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    wait until element is visible  id=noResultsTitle



*** Test Cases ***
Search for Blackmagic camera
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
   # Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM2}
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
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "${SEARCH_TERM}"
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

Begin Web Test (common)
    Open Browser  about:blank  chrome


Navigate to URL
    go to  http://www.amazon.com
     wait until page contains element  id=nav-your-amazon

