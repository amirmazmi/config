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
IPYNB_OUTFILE = f'{HTML_INFILE[:-5]}-parsed.ipynb'

create_nb = {'nbformat': 4, 'nbformat_minor': 2, 'cells': [],
              'metadata':
                  {"kernelspec":
                       {"display_name": "Python 3","language": "python", "name": "python3"}
            }}

# --------------------------------------------------------------------

def parse_data(dom):
    print("[+]Parsing data...\n")
    # get cells
    for row in dom.xpath("//div[contains(@class, 'jp-Notebook-cell')]"):
        cell = {}
        cell['metadata'] = {}
        #print(row.values())

        if 'jp-MarkdownCell' in row.values()[0]:
            cell['cell_type'] = 'markdown'
            ls_md_text = [k for k in row.xpath(".//div[contains(@class,'jp-RenderedMarkdown')]")[0].itertext()]
            #print(ls_md_text)
            cell['source'] = [''.join(ls_md_text)]
            #print(cell['source'])
        if 'jp-CodeCell' in row.values()[0]:
            for snippet in row.xpath(".//pre"):
                code_str = ''.join([k for k in snippet.itertext()])
            cell['outputs'] = []
            cell['execution_count'] = None
            cell['cell_type'] = 'code'
            cell['source'] = [code_str]

        create_nb['cells'].append(cell)
    return(create_nb)

# --------------------------------------------------------------------

if __name__ == '__main__':
    print("\t####  START : html to notebook parser ####")
    with open( HTML_INFILE, 'r') as html_input:
        html_tree = etree.HTML( html_input.read())

    nb_text = parse_data(html_tree)

    with open(IPYNB_OUTFILE , 'w') as jynotebook:
        jynotebook.write(json.dumps(nb_text))
    print("\t####   END  : html to notebook parser ####\n")

