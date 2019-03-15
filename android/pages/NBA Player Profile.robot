*** Keywords ***
Verify Page
    Wait Until Page Contains Element    xpath=//android.widget.HorizontalScrollView[@resource-id='${SCORE_PACKAGE}:id/indicator']/*/android.widget.TextView[@text='News']    
    Wait Until Page Contains Element    xpath=//android.widget.HorizontalScrollView[@resource-id='${SCORE_PACKAGE}:id/indicator']/*/android.widget.TextView[@text='Stats']    
    Wait Until Page Contains Element    xpath=//android.widget.HorizontalScrollView[@resource-id='${SCORE_PACKAGE}:id/indicator']/*/android.widget.TextView[@text='Game Log']    
    Wait Until Page Contains Element    xpath=//android.widget.HorizontalScrollView[@resource-id='${SCORE_PACKAGE}:id/indicator']/*/android.widget.TextView[@text='Info']    

Verify Player Name From Short Name
    [Documentation]    This will compare first letter of first name and full last name. ${short_name} is for example 'J. Harden'. 
    [Arguments]    ${short_name}
    ${full_name}    Get Text    id=txt_player_name
    @{split_full_name}    Split String    ${full_name}    separator=${SPACE}
    @{split_short_name}    Split String    ${short_name}    separator=${SPACE}
    # Verify First Letter of First Name 
    ${full_name_first_letter}    Get Substring    @{split_full_name}[0]  0  1
    ${short_name_first_letter}    Get Substring    @{split_short_name}[0]  0  1
    Should Be Equal As Strings    ${full_name_first_letter}    ${short_name_first_letter} 
    # Verify Last name
    Should Be Equal As Strings    @{split_full_name}[1]    @{split_short_name}[1]
    
    