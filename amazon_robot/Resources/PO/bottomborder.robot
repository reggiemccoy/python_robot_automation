*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Resource  ../Resources/config.robot

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/amazongui.robot

*** Variables ***



*** Test Cases ***




*** Keywords ***
Verify the Amazon Assistant link is present
    wait until page contains element  href=/gp/BIT/ref=footer_bit_v2_us_A0029?bitCampaignCode=A0029
    click link  href=/gp/BIT/ref=footer_bit_v2_us_A0029?bitCampaignCode=A0029
    wait until page contains  id=oneBAv2-logo
    capture page screenshot

