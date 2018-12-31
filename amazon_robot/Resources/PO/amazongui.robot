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

Perform a blank search
    sleep  3s
   Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    location should be  https://www.amazon.com/ref=nb_sb_noss_null


Perform a invalid search
   Wait Until Page Contains  Your Amazon.com
   Input Text  id=twotabsearchtextbox  '#'
   Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
   sleep  3s
   wait until element is visible  id=noResultsTitle



Perform a search for black magic 4k camera
     Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  blackmagic pocket cinema camera 4k
   Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    sleep  3s
    wait until page contains element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
    click element  xpath=//*[@id="result_2"]/div/div/div/div[1]/div/div/a/img
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  Blackmagic Design Pocket Cinema Camera 4K
   capture page screenshot  Screenshots/blackmagic_camera.png