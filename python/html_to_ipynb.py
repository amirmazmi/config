#!/usr/bin/env python3
#-------------------------------------------------------------------------------
#
#   html_to_ipynb.py - Convert HTML jupyter notebooks to .ipynb
#
#       Author  : Amir Azmi
#       Created : 7 Feb 2023
#       Updated : 20 Mar 2023
#
#-------------------------------------------------------------------------------
#
#   Usage:
#     python3 html_to_ipynb.py <file.html>
#
#-------------------------------------------------------------------------------

import json
from lxml import etree, html
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument( "file", type=str, help="Path to file")
args = parser.parse_args()


HTML_INFILE = args.file         #'02-Modeling-Returns.html'
IPYNB_OUTFILE = f'{HTML_INFILE[:-5]}-parsed1.ipynb'

create_nb = {'nbformat': 4, 'nbformat_minor': 2, 'cells': [],
              'metadata':
                  {"kernelspec":
                       {"display_name": "Python 3","language": "python", "name": "python3"}
            }}

# --------------------------------------------------------------------

def parse_data(dom):
    print("[+]Parsing data...\n")
    # get cells
    for enum,row in enumerate(dom.xpath("//div[contains(@class, 'jp-Notebook-cell')]")):
        cell = {}; cell['metadata'] = {}; ls_innertext = []

        # markdown
        if 'jp-MarkdownCell' in row.values()[0]:
            cell['cell_type'] = 'markdown'
            for k in row.xpath(".//div[contains(@class,'jp-RenderedMarkdown')]")[0].iterchildren():
                ls_content = [item1.replace("\n","  \n") for item1 in k.itertext()]
                if k.tail is not None:
                    ls_content += [ "  \n" + k.tail]

                # table of content
                if "class" in k.attrib.keys() and k.attrib['class'] == "toc":
                    ls_md_text = ''.join([ f"  \n\t{j}" if j.replace('\xa0\xa0','').replace('.','').isdigit() else j for j in ls_content])
                else:
                    ls_md_text = ''.join(ls_content)

                # if header
                if k.tag[0] == "h" and str.isdigit(k.tag[1]) and k.text is not None:
                    ls_md_text = "#" * int(k.tag[1]) + " " + k.text
                    ls_innertext.append(ls_md_text)
                elif len(ls_md_text):
                    ls_innertext.append("  \n  \n" + ls_md_text)

            cell['source'] = []
            if len(ls_innertext):
                cell['source'] = ls_innertext #[''.join(ls_innertext)]

        # if code
        if 'jp-CodeCell' in row.values()[0]:
            cell['cell_type'] = 'code'
            cell['outputs'] = []
            cell['execution_count'] = None
            for snippet in row.xpath(".//div[contains(@class, 'jp-Cell-inputWrapper')]//pre"):
                code_str = ''.join([snip for snip in snippet.itertext()])
            cell['source'] = [code_str]

        create_nb['cells'].append(cell)
    return(create_nb)

# --------------------------------------------------------------------

if __name__ == '__main__':
    print("\n\t####  START : html to notebook parser ####")
    with open( HTML_INFILE, 'r') as html_input:
        html_tree = etree.HTML( html_input.read())

    nb_text = parse_data(html_tree)

    with open(IPYNB_OUTFILE , 'w') as jynotebook:
        jynotebook.write(json.dumps(nb_text))
    print("\t####   END  : html to notebook parser ####\n")

