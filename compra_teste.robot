*** Settings ***
Library  SeleniumLibrary

Test Setup      Open Browser   browser=chrome


*** Variables ***
${AUTO_URL}                     http://automationpractice.com/index.php
${PROCEED_TO_CHECKOUT_BUTTON}   xpath=//a[@title= 'Proceed to checkout']
${BLOUSE_IMAGE}                 xpath=//img[@title = "Blouse" ]
${BLOUSE_ADD_TO_CART_BUTTON}    xpath=//a[@data-id-product = 2]
${EMAIL_ADDRESS_TEXT_FIELD}     id=email 
${STANDART_CHECKOUT_BUTTON}     class=standard-checkout
${PASSWORD_TEXT_FIELD}          name=passwd


*** Test Cases ***
Scenario 01: checkout with sucess
   Maximize Browser Window
   Go To                           ${AUTO_URL}
   Sleep                           4
   Mouse Over                      ${BLOUSE_IMAGE}
   Click Element                   ${BLOUSE_ADD_TO_CART_BUTTON}
   Wait Until Element Is Visible   ${PROCEED_TO_CHECKOUT_BUTTON}
   Click Element                   ${PROCEED_TO_CHECKOUT_BUTTON}
   Wait Until Element Is Visible   ${STANDART_CHECKOUT_BUTTON}
   Click Element                   ${STANDART_CHECKOUT_BUTTON}
   Click Element                   ${EMAIL_ADDRESS_TEXT_FIELD}  
   Input Text                      ${EMAIL_ADDRESS_TEXT_FIELD}    aula1@gmail.com 
   Click Element                   ${PASSWORD_TEXT_FIELD}
   Input Text                      ${PASSWORD_TEXT_FIELD}         fulanodetal
   Click Element    id=SubmitLogin
   Click Element    name=processAddress  
   Click Element    name=cgv
   Click Element    name=processCarrier
   Click Element    class=bankwire 
   Click Element    xpath=//button[@class = 'button btn btn-default button-medium']

***  Keywords  ***
Open virtual store and maximize window
   Maximize Browser Window
   Go To       ${AUTO_URL}


