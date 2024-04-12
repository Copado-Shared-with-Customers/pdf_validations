*** Settings ***
Library                         QForce
Library                         JSONLibrary

Variables                       ../resources/languages.yaml

Suite Setup                     OpenBrowser    about::blank    chrome
Suite Teardown                  CloseAllBrowsers

*** Variables ***
${pdf_file}    ../files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf

*** Test Cases ***
Validating text in PDF
    [Documentation]
    [Tags]    text_validation    smoke    
    UsePdf    ${pdf_file}