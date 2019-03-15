*** Keywords ***
Verify Page
    Wait Until Page Contains Element    id=league_icon 
    
Select
    [Documentation]    Options: The PLAYERS Championship, Betting News, NFL Fantasy News,
    ...    NHL Hockey, NFL Football, MLB Baseball, NBA Basketball, NCAA Football, CFL Football,
    ...    NCAA Men's Basketball, PGA Tour, Mixed Martial Arts, Formula 1 Racing, NASCAR Racing,
    ...    AAF Football, ATP Men's Tennis, WTA Women's Tennis ... 
    [Arguments]    ${item}
    Scroll To Element    xpath=//android.widget.TextView[@resource-id='${SCORE_PACKAGE}:id/league_name_text'][@text='${item}']
    Click Element     xpath=//android.widget.TextView[@resource-id='${SCORE_PACKAGE}:id/league_name_text'][@text='${item}']