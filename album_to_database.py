import xml.etree.ElementTree as ET
import sys

prefix = "{http://www.w3.org/2005/Atom}"

if __name__ == '__main__':
    inp = sys.stdin.read()
    root = ET.fromstring(inp)
    title = ""
    author = ""
    entry = list()
    for child in root:
        if child.tag == prefix+"title":
            title = child.text.encode('utf-8')
        if child.tag == prefix+"author":
            author = child[0].text.encode('utf-8')
        if child.tag == prefix+"entry":
            comment = ""
            link = ""
            for cc in child:
                if cc.tag == prefix+"summary" and not cc.text==None:
                    comment = cc.text.encode('utf-8')
                if cc.tag == prefix+"content":
                    link = cc.attrib["src"]
            entry.append((title,author,comment,link))
    print entry

