# *** Settings *** 
# Library                      DocTest.VisualTest
# Library                      QWeb
# Library                      OperatingSystem
# Suite Setup                  OpenBrowser                 about:blank                 chrome

# *** Test Cases *** 
# Compare two PDF's and highlight differences
#     goto                     https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf
#     Compare Pdf Documents   Reference.pdf   Candidate.pdf
