*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***


*** Test Cases ***
User must sign in to check out a pair of headphones "Amazon search test "
     [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.amazon.com  chrome
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  COWIN E7
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains   "COWIN E7"
    wait until page contains  COWIN E7
   click element  xpath=//*[@id="result_0"]/div/div/div/div[1]/div/div/a/img
   wait until page contains   customer reviews

   capture page screenshot  Screenshots/headphones_pic1.png
   click link  id=mbbPopoverLink2
   wait until page contains  Protection
   page should contain button  No Thanks
   page should contain button  Add

   wait until page contains  Learn more
   click button  id=mbbNoCoverage2-announce
   capture page screenshot  Screenshots/protectplan_pic1.png
  # select checkbox  id=mbb-offeringID-2
   wait until page contains  In Stock
   # I had to click twice because for some reash a single click fails in automation
   click button  id=add-to-cart-button
   click button  id=add-to-cart-button
   wait until page contains  Cart subtotal
  # page should contain button  Proceed to checkout
    capture page screenshot  /Screenshots/cart_pic1.png
    Close Browser
*** Keywords ***
