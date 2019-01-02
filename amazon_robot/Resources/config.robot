*** Settings ***

Documentation  The following file is where configuration information will be entered

*** Variables ***
# Enter the Browser and URL you would like to use for your test cases
${BROWSER} =  chrome
${BROWSER1} =  IE
${NAV_URL} =  http://www.amazon.com

 # TODO: Create a method to run the same test cases twice with a different broweser
 # TODO: Research pabot ( I have installed it already)

*** Keywords ***
Verify Amazon Assistant link
    click link


Navigate to URL
    go to  http://www.amazon.com
     wait until page contains element  id=nav-your-amazon


Begin Web Test (common)
    Open Browser  about:blank  ${BROWSER}
