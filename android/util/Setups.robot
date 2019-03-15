*** Settings ***
Resource    ../resource.robot

*** Keywords ***
Setup Appium Servers
    [Arguments]    @{users}
    Run Process            pwd                   shell=True    alias=proc1
    ${WORKING_PATH}        Get Process Result    proc1         stdout=true
    Set Global Variable    ${WORKING_PATH}
    Kill Appium
    #Clears List
    ${ACTIVE_USERS}        Create List
    Set Global Variable    ${ACTIVE_USERS}
    :FOR    ${user}    IN    @{USERS}
    \    Run Keywords
    \    ...    Spawn Appium Server    ${user}
    \    ...    AND    First Open Application  ${user}

Setup For Tests
    Switch Application    ${Andi.KEY}
    Launch Application
    Main menu.Select Menu Item    Scores
    
Setup For Login
    Switch Application    ${Andi.KEY}
    Reset Application
