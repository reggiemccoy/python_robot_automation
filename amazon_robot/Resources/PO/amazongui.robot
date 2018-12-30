*** Settings ***

Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary

*** Keywords ***

Navigate to URL
    go to  http://www.amazon.com
    wait until page contains element  id=nav-your-amazon

Input Search for toy
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"

Take screenshot of the toy
    capture page screenshot  Screenshots/ferrari_458.png

