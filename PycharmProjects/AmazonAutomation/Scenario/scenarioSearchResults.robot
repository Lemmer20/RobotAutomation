*** Settings ***
Documentation  This is all the list of all scenarios that can be found or made in the Search Results Page of Amazon
...  This file also calls the needed objects for the search Result Page
Resource          ../Config/Setup.robot  #For the Environment and Libraries
Resource          ../Objects/SearchResults/objectSearchResults.robot

*** Keywords ***
Verify if the Search Results is displayed
    [Documentation]  This will verify if the search product is displayed in the Page
    Wait Until Page Contains Element  ${searchResult_AllResult}  timeout=60
    sleep  2

Select Product in Search Results
    [Documentation]  This will select the product in Search Result page
    ...  and open it on Product Details Page
    [Arguments]  ${productTitle}  ${productPrice}
    wait until element is visible  //div[@class='a-section a-spacing-medium' and contains(.,'${productTitle}') and contains(.,'${productPrice}')]  timeout=60
    click element  //div[@class='a-section a-spacing-medium' and contains(.,'${productTitle}') and contains(.,'${productPrice}')]
    sleep  2

Select Product in Category
    [Documentation]  This will select the product in Category
    [Arguments]  ${productTitle}  ${productPrice}
    wait until element is visible  //div[contains(@id,'acs-product-block') and contains(.,'${productTitle}') and contains(.,'${productPrice}')]//img  timeout=60
    click element  //div[contains(@id,'acs-product-block') and contains(.,'${productTitle}') and contains(.,'${productPrice}')]//img
    sleep  2
Filter by Average Customer Review
    [Documentation]  This will filter the value based on Customer Review
    ...  Verify if the list is sorted based on stars
    [Arguments]  ${stars}
    wait until element is visible  //div[@id='reviewsRefinements']//li[contains(.,'${stars} Star')]  timeout=60
    sleep  2
    click element  //div[@id='reviewsRefinements']//li[contains(.,'${stars} Star')]
    wait until element is visible  //div[@class='a-section a-spacing-small a-spacing-top-small']//span[contains(.,'${stars} Star')]  timeout=60

Clear Filter by Average Customer Review
    [Documentation]  This will clear the filter of Average Customer Review
    wait until element is visible  ${searchresult_listaveragecustomerreview_linkclear}  timeout=60
    sleep  2
    click element  ${searchresult_listaveragecustomerreview_linkclear}
    Wait Until Page Does Not Contain Element  ${searchresult_listaveragecustomerreview_linkclear}  timeout=60
    sleep  2

Filter by Brand
    [Documentation]  This will filter the value based on Customer Review
    ...  Verify if the list is sorted based on stars
    [Arguments]  ${brand}
    wait until element is visible  //div[@id='brandsRefinements']//li[contains(.,'${brand}')]//label  timeout=60
    sleep  2
    click element  //div[@id='brandsRefinements']//li[contains(.,'${brand}')]//label
    wait until element is visible  //div[@class='a-section a-spacing-small a-spacing-top-small']//span[contains(.,'${brand}')]  timeout=60

Clear Filter by Brand
    [Documentation]  This will clear the filter of Average Customer Review
    wait until element is visible  ${searchResult_listBrand_linkClear}  timeout=60
    sleep  2
    click element  ${searchResult_listBrand_linkClear}
    Wait Until Page Does Not Contain Element  ${searchResult_listBrand_linkClear}  timeout=60
    sleep  2


