***Settings***
Library        BuiltIn
Library        OperatingSystem
Library        libraries/extract_pdf_fonts.py
Library    

***Variables***
${PDF_FILE}    files/How_to_Simplify_Salesforce_as_You_Scale_A_Developer_Guide_Copado.pdf

***Test Cases***
Extract Font Styles From PDF
    ${font_styles}=    Evaluate    extract_font_styles('${PDF_FILE}')
    Log    ${font_styles}
    # Add assertions to validate the font styles as needed
