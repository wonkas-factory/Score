*** Settings ***
Resource          ../resource.robot
Suite Setup       Setup Appium Servers    ${Andi}
Suite Teardown    Close Appium Servers
Test Setup        Setup For Tests
Test Teardown     Test Teardown
Force Tags        NBA

*** Test Cases ***
NBA Leader Player Profile Verification
    [Documentation]    Andi views NBA League
    ...                Andi goes to Leaders
    ...                Andi selects a random player
    ...                Andi verifies the player is correct
    [Tags]    Author:willy
    Main menu.Select Menu Item    Leagues
    League.Verify Page
    League.Select    NBA Basketball
    NBA Basketball.Select Tab    Leaders
    NBA Basketball.Verify Leaders Section
    ${name}    NBA Basketball.Get Random Leader Name
    NBA Basketball.Select Name    ${name}
    NBA Player Profile.Verify Page  
    NBA Player Profile.Verify Player Name From Short Name    ${name}
    Device Utility.Capture Screenshot    ${Andi.KEY}    ${name}-profile   
    