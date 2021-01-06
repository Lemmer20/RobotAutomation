*** Settings ***
Documentation     This is all the list of all scenarios that can be found or made in the Homepage of the Amazon
...               This file also calls the needed objects for the homepage
Resource          ../Config/Setup.robot    #For the Environment and Libraries
Resource          ../Objects/Homepage/objectHomepage.robot

*** Keywords ***
Open Amazon Homepage
    [Documentation]    This will open a browser and Amazon Homepage
    Open Browser    ${test_envi}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${homepage_amazonlogo}    timeout=60
    #Assertions
    sleep    3
    element should be visible    ${homepage_inputsearch}
    element should be visible    ${homepage_buttonsearch}
    Page Should Contain Element    ${homepage_dropdownfilter}
    element should be visible    ${homepage_iconcart}
    element should be visible    ${homepage_iconmenu}

Search Products
    [Arguments]    ${product}
    [Documentation]    This will search a product
    wait until element is visible    ${homepage_inputsearch}    timeout=60
    click element    ${homepage_inputsearch}
    sleep    1
    input text    ${homepage_inputsearch}    text=${product}
    click element    ${homepage_buttonsearch}
    sleep    2

Go to Shopping Cart Page
    [Documentation]    This will go to the shopping Cart page
    wait until element is visible    ${homepage_iconcart}    timeout=60
    click element    ${homepage_iconcart}
    wait until element is visible    ${shoppingCart_textShoppingCart}    timeout=60

Verify Items in Shopping Cart
    [Arguments]    ${productTitle}
    [Documentation]    This will verify if the item is added in the Shopping Cart Page
    wait until element is visible    //div[@class='sc-list-item-content' and contains(.,'${productTitle}')]    timeout=60
    sleep    2

Closing Browser
    [Documentation]    This will close the browser open
    sleep    2
    Close Browser

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Shop by Category
    [Arguments]    ${generalCategory}    ${specificCategory}
    [Documentation]    This will display the searc hresults by selected Category
    wait until element is visible    ${homepage_iconmenu}    timeout=60
    sleep    2
    click element    ${homepage_iconmenu}
    wait until element is visible    ${homepage_modalmenushopbycategory}    timeout=60
    wait until element is visible    //div[@id='hmenu-content']//li[contains(.,'${generalCategory}')]    timeout=60
    sleep    2
    click element    //div[@id='hmenu-content']//li[contains(.,'${generalCategory}')]
    wait until element is visible    //div[@id='hmenu-content']//li[contains(.,'${specificCategory}')]    timeout=60
    sleep    2
    click element    //div[@id='hmenu-content']//li[contains(.,'${specificCategory}')]
    sleep    2
