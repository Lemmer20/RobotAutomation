*** Settings ***
Documentation  This script will search a product
...  and add it to cart and verify if the item was successfully added to the cart
Resource    ../../Scenario/scenarioHomepage.robot
Resource    ../../Scenario/scenarioSearchResults.robot
Resource    ../../TestData/Specific/Products/FT-AZ002_TestData.robot

*** Test Cases ***
Search the Product
    [Documentation]  This will search the product and  it should be redirect to the Search Result Page
    Open Amazon Homepage
    #${product}
    Search Products  ${productSearch}
    Verify if the Search Results is displayed

Filter the Products by Average Customer Review
    [Documentation]  This will filter the products search result based on the selected criteria of Avg. Customer Review
    #${stars}
    Scroll Page To Location    0   300
    Filter by Average Customer Review  ${stars}
    sleep  2
    Scroll Page To Location    0   300
    Clear Filter by Average Customer Review

Filter the Products by Brand
    [Documentation]  This will filter the products search result based on the selected criteria of Brand
    Scroll Page To Location    0   600
    #${brand}
    sleep  5
    Filter by Brand  ${brand}
    sleep  2
    Scroll Page To Location    0   600
    Clear Filter by Brand

Ending Script Execution
    [Documentation]  This will close all the browser and end the script execution
    Closing Browser
