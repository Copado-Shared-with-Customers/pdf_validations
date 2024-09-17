*** Settings ***
Library                   QForce
Library                   JSONLibrary
Library                   QImage
Library                   QVision
Library                   OperatingSystem

Suite Setup               OpenBrowser                 about:blank    chrome
Suite Teardown            CloseAllBrowsers

*** Variables ***
${pdf_file}               ${CURDIR}/files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf
${open_pdf}               file:///${CURDIR}/files//How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf

*** Test Cases ***
Validate text in PDF
    [Documentation]       Validates that the specified PDF document contains the text "15 Recommendations for Adding Users".
    [Tags]                text_validation             smoke
    UsePdf                ${pdf_file}
    VerifyPdfText         15 Recommendations for Adding Users

Open PDF and validate text using OCR
    [Documentation]       Opens a PDF document from a specified location and validates the presence of the
    ...                   text "How to Simplify" using OCR.
    [Tags]                ocr_validation
    GoTo                  ${open_pdf}
    QVision.VerifyText    How to Simplify
    QVision.ClickText     COPADO
    QVision.HotKey        pagedown
    QVision.VerifyText    How Do You Grow Your Team?
    List Directory        ${CURDIR}/files/