*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Resource  ../Resources/config.robot

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***
# ${BROWSER} =  chrome
# ${NAV_URL} =  http://www.amazon.com
${SEARCH_TERM} =  Ferrari 458
${SEARCH_TERM2}=  blackmagic pocket cinema camera 4k
${SEARCH_TERM3}=  Cooler Master MasterCase H500 ATX Mid-Tower

*** Test Cases ***
Verify the homepage navigation button
  [Documentation]  The following test cases verifies homepage button is present
    [Tags]  Smoke

    Begin Web Test (common)
    Navigate to URL



*** Test Cases ***
 Banner Country
    [Documentation]  The following test cases verifies the country of origin
    [Tags]  Smoke
    wait until element is visible  id=icp-touch-link-country
  #  wait until page contains  id=a-popover-header-2
  #  Click Element    xpath=(//input[@class="a-button-input"])[2]
    capture page screenshot  Screenshots/Country/Region.png

  #  close browser



*** Test Cases ***
Verify the homepage left-hand popup-menu
  [Documentation]  The following test cases verifies homepage left-hand popup-menu
    [Tags]  Smoke
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

    sleep  3s
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    location should be  https://www.amazon.com/ref=nb_sb_noss_null


*** Test Cases ***
Verify the user can do a invalid search
  [Documentation]  Verify the user can do a invalid search
    [Tags]  Regression

    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  '#'
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    wait until element is visible  id=noResultsTitle



*** Test Cases ***
Search for Blackmagic camera
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM2}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    wait until page contains element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
    click element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
    Wait Until Page Contains  ${SEARCH_TERM2}
   capture page screenshot  Screenshots/blackmagic_camera.png



*** Test Cases ***
Search for Cooler Master MasterCase H500 ATX Mid-Tower
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM3}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Click Element    //img[@class="s-access-image cfMarker"]
    # Click Button    xpath=//*[@id="result_0"]/div/div[2]/div/div[1]/div/div/a/img
    wait until page contains  Cooler Master MasterCase H500 ATX Mid-Tower
    #  Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    capture page screenshot  Screenshots/H500ATX_camera.png






*** Test Cases ***
User must sign in to check out "Amazon search test"
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke


    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  ${SEARCH_TERM}
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "${SEARCH_TERM}"
    capture page screenshot  Screenshots/${SEARCH_TERM}.png

*** Test Cases ***
 Add the Ferrari to the cart
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Click Link  css=#result_0 > div > div > div > div.a-fixed-left-grid-col.a-col-right > div.a-row.a-spacing-small > div:nth-child(1) > a
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart
    Click Link  id=hlb-ptc-btn-native
    close browser









*** Keywords ***

Begin Web Test (common)
    Open Browser  about:blank  ${BROWSER}


Navigate to URL
    go to  http://www.amazon.com
     wait until page contains element  id=nav-your-amazon

