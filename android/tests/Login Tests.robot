*** Settings ***
Resource          ../resource.robot
Suite Setup       Setup Appium Servers    ${Andi}
Suite Teardown    Close Appium Servers
Test Setup        Setup For Login
Test Teardown     Test Teardown
Force Tags        Login

*** Test Cases ***
Sign Into Account
    [Documentation]    Andi selects sign in
    ...                Andi enters credentials
    ...                Andi logged in screen Scores
    [Tags]    Author:willy
    Login.Select Sign In
    Login.Input Username    ${Andi.SCORE_EMAIL}
    Login.Input Password    ${Andi.SCORE_PASSWORD}
    Login.Select Login
    Scores.Verify Page
  