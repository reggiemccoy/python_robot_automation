*** Settings ***
# Library  Selenium2Library
Library  SeleniumLibrary
Documentation  This is some basic info about the who script


*** Variables ***


*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke

    open browser  http://www.amazon.com chrome

*** Keywords ***
