*** Settings ***
Documentation  This file will hold all the objects that can be found in homepage

*** Variables ***
${homepage_amazonLogo}  //div[@id='nav-logo']//a[@aria-label='Amazon']
${homepage_iconMenu}  //div[@id='nav-belt']//a[@id='nav-hamburger-menu']
${homepage_inputSearch}  //div[@id='nav-search']//input[@id='twotabsearchtextbox']
${homepage_buttonSearch}  //div[@id='nav-search']//input[@value='Go']
${homepage_dropdownFilter}  //div[@id='nav-search']//select[@id='searchDropdownBox']
${homepage_iconCart}  //div[@id='nav-tools']//a[@id='nav-cart']
${shoppingCart_textShoppingCart}  //h2[contains(.,'Shopping Cart')]

${homepage_modalMenuShopByCategory}  //div[@id='hmenu-content' and contains(.,'shop by category')]