*** Settings ***
Documentation     apa_automation_testing_for_regression
...
Resource          ../resource.robot
*** Variable ***
${customer}    Customer1
*** Test Cases ***

Login
    Login
    Click Element   xpath:(//p[@class="arrow arrow"])[2]
    #${customers}    Create List    xpath://div[@class="setup-bottom col-xs-12 col-md-4 col-lg-3"]
    ${length_customer}   Get Length    xpath://div[@class="customer-box"]
    Should Be True    ${length_customer}>0
    
    Wait Until Element Is Visible  xpath://div[@title="${customer}"]/following-sibling::div/div/div/div[1]
    #Click Element  xpath://div[@class="customer-caption"][div[@title="${customer}"]]/div[@class="process-section"]/div
    Click Element  xpath://div[@title="${customer}"]/following-sibling::div/div/div/div[1]
    Set Selenium Implicit Wait    10000
    
    Click Element  xpath://div[@class="dropdown-menu down"]//following-sibling::div[1]/li[@title="${process}"]
    Get Selenium Implicit Wait
    Click Element  xpath://div[@title="${customer}"]/ancestor::div/following-sibling::div/div/div/p[@class='jump-to-pe pe-able-click']
    Get Selenium Implicit Wait
    ${length_processmap}  Get Length   xpath://div[@class="pn-node pn-trans"]
    Should Be True  ${length_processmap}>0
    Get Selenium Implicit Wait
    
    [Teardown]    Close Browser
