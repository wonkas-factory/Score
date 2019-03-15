*** Keywords ***
Select Menu Item
    [Documentation]    Options: News, Scores, Favorites, Discover, Leagues 
    [Arguments]    ${item}
    Wait Until Page Contains Element    accessibility_id=${item}
    Click Element     accessibility_id=${item}