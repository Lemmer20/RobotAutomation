*** Settings ***
Documentation  This script will search a product
...  and add it to cart and verify if the item was successfully added to the cart
Resource    ../../Scenario/scenarioHomepage.robot
Resource    ../../Scenario/scenarioSearchResults.robot
Resource    ../../Scenario/scenarioProductDetails.robot
Resource    ../../TestData/Specific/Products/FT-AZ001_TestData.robot

*** Test Cases ***
Search the Product
    [Documentation]  This will search the product and  it should be redirect to the Search Result Page
    Open Amazon Homepage
    #${product}
    Search Products  ${productSearch}
    Verify if the Search Results is displayed
Selecting Product and Verify it's Details
    [Documentation]  This will verify the details of the selected Products
     #${product}
    Select Product in Search Results  ${productTitle}  ${productPrice}
    verify if the product selected opens  ${productTitle}  ${productPrice}
    Ver
    #This will  all verify the Product Features of the item
    ${productFeatures}=  create list    @{productFeatures}
    :FOR  ${productFeatures}  IN ZIP  ${productFeatures}
    #@{productfeatures}
    \    Verify if the Features of the Product is displayed  ${productFeatures}

    #This will all verify the Product Specifications of the item
    ${productSpecsTitle}=  create list    @{productSpecsTitle}
    ${productSpecsValue}=  create list    @{productSpecsValue}
    :FOR  ${productSpecsTitle}  ${productSpecsValue}  IN ZIP  ${productSpecsTitle}  ${productSpecsValue}
    #@{productspecstitle}  @{productspecsvalue}
    \   Verify if the Product Specifications of the Product is displayed  ${productSpecsTitle}  ${productSpecsValue}
    #${quantity}
Search Products
Add Item to the Cart
    [Documentation]  This will add the product to the cart
    ...  Verify if the item is successfully added in the Shopping Cart
    ...  And  if the price and quantity is correct
    Setting Product Quantity  ${quantity}
    Add to Cart
    Verify if the added Product Quantity and Total Price is Correct  ${productPrice}  ${totalPrice}  ${quantity}

Confirming Item Added in Shopping Cart
    [Documentation]  This will verify if the item is confirm added to Shopping Cart
    Go to Shopping Cart Page
    Verify Items in Shopping Cart  ${producttitle}

Ending Script Execution
    [Documentation]  This will close all the browser and end the script execution
    Closing Browser
