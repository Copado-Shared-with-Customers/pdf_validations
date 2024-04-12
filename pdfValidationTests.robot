*** Settings ***
Library                         QForce
Library                         JSONLibrary

Variables                       ../resources/languages.yaml

Suite Setup                     OpenBrowser    about:blank    chrome
Suite Teardown                  CloseAllBrowsers

*** Variables ***
${pdf_file}    ../files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf

*** Test Cases ***
Validating text in PDF
    [Documentation]
    [Tags]    text_validation    smoke    
    UsePdf    ${pdf_file}
    VerifyPdfText           15 Recommendations for Adding Users
    VerifyPdfText           After implementing Salesforce,
    ${file_content}     GetPdfText
    Log To Console      ${file_content}
    GoTo                ${pdf_file}