*** Keywords ***
Select Sign In
    Wait Until Page Contains Element    id=txt_sign_in
    Click Element with Offset    id=txt_sign_in    0.85
    
Input Username
    [Arguments]    ${user}
    Wait Until Page Contains Element    id=login_email_edit_text
    Input Text    id=login_email_edit_text    ${user}
    
Input Password
    [Arguments]    ${pass}
    Wait Until Page Contains Element    id=login_email_edit_text
    Input Text    id=login_password_edit_text    ${pass}
 
Select Login
    Wait Until Page Contains Element    id=sign_in_button
    Click Element    id=sign_in_button
