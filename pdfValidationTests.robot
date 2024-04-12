*** Settings ***
Library                   QForce
Library                   JSONLibrary
Library                   QImage
Library                   QVision

Variables                 ../resources/languages.yaml

Suite Setup               OpenBrowser                 about:blank        chrome
Suite Teardown            CloseAllBrowsers

*** Variables ***
${pdf_file}               ../files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf
${open_pdf}               file:///home/services/suite/files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf

*** Test Cases ***
Validate text in PDF
    [Documentation]
    [Tags]                text_validation             smoke
    UsePdf                ${pdf_file}
    VerifyPdfText         15 Recommendations for Adding Users

Open PDF and validate text using OCR
    [Documentation]
    [Tags]
    GoTo                  ${open_pdf}
    QVision.VerifyText    How to Simplify
