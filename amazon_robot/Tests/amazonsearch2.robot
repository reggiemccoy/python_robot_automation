*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

Resource    Resource/amazon.robot
Documentation  This is some basic info about the whole suite
Resource  ../Resources/PO/amazongui.robot         # I needed to add the "..", for relative path
Resource  ../Resources/PO/common.robot

Test Setup  Begin Web Test
Test Teardown  End Web Test

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***


*** Test Cases ***
Verify the homepage navigation button
  [Documentation]  The following test cases verifies homepage button is present
    [Tags]  Smoke

# Below I am calling keywords from the correct robot pagelogic /resources file

    amazongui.Navigate to URL
    amazongui.Input Search for toy
    amazongui.Take screenshot of the toy








