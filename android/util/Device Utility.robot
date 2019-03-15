*** Keywords ***
Capture Screenshot
    [Documentation]  Takes screenshot and put filename with ${user} and ${note} in file name.
    [Arguments]    ${user}    ${note}=${EMPTY} 
    ${time}    Get Time
    Switch Application    ${user}
    Capture Page Screenshot   filename=${TEST NAME}-${user}-${time}-${note}.png

Capture Screenshot For Failed Tests
    :FOR    ${user}    IN    @{ACTIVE_USERS}
    \       Switch Application    ${user}
    \       Capture Screenshot   ${user}    test_failed

Swipe Down
    [Documentation]  Defaults swipes 40% of screen. Change locator to focus in a specific view
    [Arguments]    ${locator}=xpath=//*  ${start}=0.3  ${end}=0.7
    ${size}        Get Element Size        ${locator}
    ${location}    Get Element Location    ${locator}

    ${start_x}=    Evaluate      ${location['x']} + (${size['width']} * 0.5)
    ${start_y}=    Evaluate      ${location['y']} + (${size['height']} * ${start})
    ${end_x}=      Evaluate      ${location['x']} + (${size['width']} * 0.5)
    ${end_y}=      Evaluate      ${location['y']} + (${size['height']} * ${end})
    Swipe          ${start_x}    ${start_y}    ${end_x}    ${end_y}    1000
    Sleep          ${FAST_TIMEOUT}

Swipe Up
    [Documentation]  Defaults swipes 40% of screen. Change locator to focus in a specific view
    [Arguments]    ${locator}=xpath=//*  ${start}=0.7  ${end}=0.3
    ${size}        Get Element Size        ${locator}
    ${location}    Get Element Location    ${locator}

    ${start_x}=    Evaluate    ${location['x']} + (${size['width']} * 0.5)
    ${start_y}=    Evaluate    ${location['y']} + (${size['height']} * ${start})
    ${end_x}=      Evaluate    ${location['x']} + (${size['width']} * 0.5)
    ${end_y}=      Evaluate    ${location['y']} + (${size['height']} * ${end})
    Swipe          ${start_x}          ${start_y}    ${end_x}    ${end_y}    1000
    Sleep          ${FAST_TIMEOUT}

Scroll Down To Element
    [Documentation]    locator: element to find
    ...                max_scrolls: number of scroll attempts before failure (default 10)
    ...                scroll_area: specify a certain scroll view area by a locator. Otherwise uses screen size
    [Arguments]    ${locator}    ${max_scrolls}=10    ${scroll_area}=xpath=//*

    :FOR    ${count}    IN RANGE    0    ${max_scrolls}+1
    \    ${status}    Run Keyword And Return Status    Wait Until Page Contains Element  ${locator}    timeout=${FAST_TIMEOUT}
    \    Run Keyword If    ${status} == ${TRUE}        Exit For Loop
    \    Run Keyword If    ${count}==${max_scrolls}    Fail    msg=Did not find "${locator}" after scrolling down a max ${max_scrolls} times.
    \    Swipe Up          ${scroll_area}

Scroll Up To Element
    [Documentation]    locator: element to find
    ...                max_scrolls: number of scroll attempts before failure (default 10)
    ...                scroll_area: specify a certain scroll view area by a locator. Otherwise uses screen size
    [Arguments]    ${locator}    ${max_scrolls}=10    ${scroll_area}=xpath=//*

    :FOR    ${count}    IN RANGE    0    ${max_scrolls}+1
    \    ${status}    Run Keyword And Return Status    Wait Until Page Contains Element  ${locator}    timeout=${FAST_TIMEOUT}
    \    Run Keyword If    ${status} == ${TRUE}        Exit For Loop
    \    Run Keyword If    ${count}==${max_scrolls}    Fail    msg=Did not find "${locator}" after scrolling up a max ${max_scrolls} times.
    \    Swipe Down        ${scroll_area}

Scroll To Element
    [Documentation]    Helper keyword that scrolls down and up the page for an element
    ...                locator: element to find
    ...                max_scrolls: number of scroll attempts before failure (default 10)
    ...                scroll_area: specify a certain scroll view area by a locator. Otherwise uses screen size
    [Arguments]    ${locator}    ${max_scrolls}=10    ${scroll_area}=xpath=//*

    Run Keyword And Ignore Error    Scroll Down To Element    ${locator}    ${max_scrolls}    ${scroll_area}
    Run Keyword And Ignore Error    Scroll Up To Element      ${locator}    ${max_scrolls}    ${scroll_area}
                                    Scroll Up To Element      ${locator}    ${max_scrolls}    ${scroll_area}

Click Element with Offset
    [Documentation]    Used when want to click center of element or any % offset
    [Arguments]    ${locator}    ${x_offset}=0.5     ${y_offset}=0.5
    Wait Until Page Contains Element               ${locator}
    ${element_location}    Get Element Location    ${locator}
    ${element_size}        Get Element Size        ${locator}
    ${x}                   Evaluate                ${element_location['x']} + (${element_size['width']} * ${x_offset})
    ${y}                   Evaluate                ${element_location['y']} + (${element_size['height']} * ${x_offset})
    Click A Point          ${x}    ${y}
