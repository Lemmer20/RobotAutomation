*** Settings ***
Documentation  This script will search a product
...  and add it to cart and verify if the item was successfully added to the cart
Resource    ../../Scenario/scenarioHomepage.robot
Resource    ../../Scenario/scenarioSearchResults.robot
Resource    ../../Scenario/scenarioProductDetails.robot
Resource    ../../TestData/Specific/Products/FT-AZ003_TestData.robot

*** Test Cases ***
Search by Category
    [Documentation]  This will search product by category and it should be redirect to Result Page of the selected Category
    #${generalcategory}  ${specificcategory}
    Open Amazon Homepage
    Shop by Category  ${generalcategory}  ${specificcategory}

Search and Verify the selected Product Details
    [Documentation]  This will search and verify the details of the selected Products
     #${product}
    Select Product in Category  ${productTitle}  ${productPrice}
    verify If The Product Selected Opens  ${productTitle}  ${productPrice}

Ending Script Execution
    [Documentation]  This will close all the browser and end the script execution
    Closing Browser

#robot --log FT-RC011_Log.html  --report FT-RC011_Report.html --output FT-RC011_Output.xml  --outputdir TestResults/Regression-101619/FalsePositive  Scripts/Records/FT-RC011*.robot