*** Settings ***
Documentation  This is all the list of all scenarios that can be found or made in the Product Details Page of Amazon
...  This file also calls the needed objects for the Product Details Page
Resource          ../Config/Setup.robot  #For the Environment and Libraries
Resource          ../Objects/ProductDetails/objectProductDetails.robot
Library  Selenium2Library
*** Keywords ***
Verify if the Product selected opens
    [Documentation]  This will open the product selected in Product Details Page
    [Arguments]  ${productTitle}  ${productPrice}
    wait until element is visible  //span[@id='productTitle' and contains(.,'${productTitle}')]  timeout=60
    wait until element is visible  //div[@id='price']//span[@id='priceblock_ourprice' and contains(.,'${productPrice}')]
    wait
    sleep  2

Verify if the Features of the Product is displayed
    [Documentation]  This will verify if the product features are all displayed
    [Arguments]  ${productFeatures}
    element should be visible  //div[@id='feature-bullets']//span[contains(.,'${productFeatures}')]

Verify if the Product Specifications of the Product is displayed
    [Documentation]  This will verify if the product specifications are all displayed
    [Arguments]  ${productSpecsTitle}  ${productSpecsValue}
    element should be visible  //table[@id='product-specification-table']//tr[contains(.,'${productSpecsTitle}') and contains(.,'${productSpecsValue}')]

Setting Product Quantity
    [Documentation]  This will set the quantity to be bought
    [Arguments]  ${quantity}
    wait until element is visible  ${productdetails_dropdownquantity}  timeout=60
    click element  ${productdetails_dropdownquantity}
    #Select from list by label is not working in this page. Using Alternative
    click element  //li[contains(@aria-labelledby,'quantity') and contains(.,'${quantity}')]

Add to Cart
    [Documentation]  This will add the product to the Cart
    wait until element is visible  ${productDetails_buttonAddToCart}  timeout=60
    click element  ${productDetails_buttonAddToCart}
    Wait Until Page Does Not Contain Element  ${productDetails_buttonAddToCart}  timeout=60
    sleep  2

Verify if the added Product Quantity and Total Price is Correct
    [Documentation]  This will verify if the Total Price is correct and quantity
    [Arguments]    ${productPrice}  ${totalPrice}  ${quantity}
    ${productPrice}=   remove string  ${productprice}  ,  $
    ${computedTotalPrice}=  evaluate  ${quantity} * ${productPrice}
    Should be equal as numbers    ${totalPrice}  ${computedTotalPrice}

    element should be visible  //div[contains(@id,'order-row-with-divider') and contains(.,'Added to Cart')]//span[contains(@class,'price') and contains(.,'${totalPrice}')]
    element should be visible  //div[contains(@id,'order-row-with-divider') and contains(.,'Added to Cart')]//span[contains(@class,'subtotal') and contains(.,'${quantity} item')]