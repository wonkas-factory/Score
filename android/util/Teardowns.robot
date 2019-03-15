*** Settings ***
Resource    ../resource.robot

*** Keywords ***
Close Appium Servers
    Run Keyword And Ignore Error    Close All Applications
    Kill Appium

Test Teardown
    Run Keyword If Test Failed      Capture Screenshot For Failed Tests
    Quit All Applications
