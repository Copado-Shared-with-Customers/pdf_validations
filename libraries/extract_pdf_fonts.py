from pdfminer.pdfparser import PDFParser
from pdfminer.pdfdocument import PDFDocument
from pdfminer.pdfpage import PDFPage
from pdfminer.pdfpagecontent import PDFPageContent
from pdfminer.pdftypes import resolve1
from pdfminer.psparser import PSLiteral


def extract_font_styles(pdf_path):
    """
    Extracts font styles from a PDF file.
    Args:
        pdf_path (str): The path to the PDF file.
    Returns:
        dict: A dictionary containing font names and their associated styles.
    """
    font_styles = {}
    with open(pdf_path, "rb") as file:
        parser = PDFParser(file)
        document = PDFDocument(parser)

        # Iterate through each page
        for page in PDFPage.create_pages(document):
            # Check if page has resources
            if "Resources" in page.attrs:
                resources = resolve1(page.attrs["Resources"])

                # Check if resources has fonts
                if "Font" in resources:
                    fonts = resolve1(resources["Font"])

                    # Iterate through each font
                    for font_name, font_obj in fonts.items():
                        font = resolve1(font_obj)

                        # Extract font name
                        if "BaseFont" in font:
                            font_name_full = font["BaseFont"]
                        else:
                            font_name_full = font_name

                        # Extract font style (e.g., Bold, Italic)
                        font_style = ""
                        if "FontDescriptor" in font:
                            font_descriptor = resolve1(font["FontDescriptor"])
                            if "FontWeight" in font_descriptor:
                                font_weight = font_descriptor["FontWeight"]
                                if font_weight > 400:  # Arbitrary threshold for bold
                                    font_style += "Bold "

                            if "Flags" in font_descriptor:
                                flags = font_descriptor["Flags"]
                                if flags & 2**1:  # Italic flag
                                    font_style += "Italic "

                        font_styles[font_name_full] = font_style.strip()
    return font_styles


if __name__ == "__main__":
    pdf_file = "your_pdf_file.pdf"  # Replace with your PDF file path
    styles = extract_font_styles(pdf_file)
    for name, style in styles.items():
        print(f"Font: {name}, Style: {style}")
