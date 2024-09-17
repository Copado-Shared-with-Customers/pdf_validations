*** Settings *** 
Library                      DocTest.VisualTest
Library                      QWeb
Library                      OperatingSystem
Suite Setup                  OpenBrowser                 about:blank                 chrome

*** Test Cases *** 
Compare two Images and highlight differences
    goto                     https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf
    Compare Pdf Documents    reference_document=c4611_sample_explain.pdf             candidate_document=PDF Bookmark Sample.pdf
    Log To Console           ${CURDIR}/../Downloads
    List Directory           ${CURDIR}