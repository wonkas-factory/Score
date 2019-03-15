*** Keywords ***
Select Tab
    [Documentation]    Options: Scores, News, Standings, Leaders
    [Arguments]    ${menu}
    Wait Until Page Contains Element    accessibility_id=${menu}
    Click Element    accessibility_id=${menu}
    
Verify Leaders Section
    Wait Until Page Contains Element    id=txt_leader

Get Random Leader Name
    @{elements}    Get Webelements    id=txt_name
    ${length}    Get Length    ${elements}
    ${random int}    Evaluate	random.randint(0, ${length}-1)    	modules=random
    ${name}    Get Text    @{elements}[${random int}]
    [Return]  ${name}

Select Name
    [Arguments]    ${name}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id='${SCORE_PACKAGE}:id/txt_name'][@text='${name}']
    Click Element    xpath=//android.widget.TextView[@resource-id='${SCORE_PACKAGE}:id/txt_name'][@text='${name}']