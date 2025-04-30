***Settings***
Library    BuiltIn
Library    OperatingSystem
Library    libraries/extract_pdf_fonts.py

***Variables***
${PDF_FILE}    path/to/your/document.pdf
***Test Cases***
Extract Font Styles From PDF
 ${font_styles}=    Evaluate    extract_font_styles('${PDF_FILE}')
 Log    ${font_styles}
 # Add assertions to validate the font styles as needed
