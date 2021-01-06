*** Settings ***
Documentation  This file will hold all the objects in Product Details page

*** Variables ***
${productDetails_dropdownQuantity}  //span[@id='a-autoid-0-announce']
${productDetails_buttonAddToCart}  //input[@id='add-to-cart-button']
${productDetails_buttonBuyNow}  //input[@id='buy-now-button']
${productDetails_addToCart_successMessageAddedToCart}  //div[contains(@id,'order-row-with-divider') and contains(.,'Added to Cart')]