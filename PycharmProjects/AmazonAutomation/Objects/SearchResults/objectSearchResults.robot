*** Settings ***
Documentation  This file will hold all the objects that can be found in search results page

*** Variables ***
${searchResult_AllResult}  //div[@id='search']
${searchResult_dropdownSortBy}  //select[@id='s-result-sort-select']
${searchResult_listAverageCustomerReview_linkClear}  //div[@id='reviewsRefinements']//a[contains(.,'Clear')]
${searchResult_listBrand_linkClear}  //div[@id='brandsRefinements']//a[contains(.,'Clear')]