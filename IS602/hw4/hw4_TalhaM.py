import urllib
from bs4 import BeautifulSoup
import json
from watson_developer_cloud import AlchemyLanguageV1

def extractor(pjson,numvar):
# extracts the keywords returned by Alchemy API in JSON format
    listvar = pjson["keywords"]
    listkey=[]
    if(numvar > len(listvar)):
        print "not enough keywords"
    else:
        for i in range(numvar):
            listkey.append(listvar[i]["text"])
    return listkey

if __name__ == "__main__":
# the link for analysis
    link = "http://themanbookerprize.com/books/sellout-by-paul-beatty"
    f = urllib.urlopen(link)
    website = f.read()
    soup = BeautifulSoup(website, 'html.parser')
# print website
    print "pretty soup"
    print(soup.prettify())
# select text to analyze, the description / summary of the book
    t1 = soup.find('div', 'field-item even')

# replace one tag and allow for spaces in the title
    new_tag = soup.new_tag('b')
    new_tag.string = " "
    t1.strong.replace_with(new_tag)
    new_tag.string = " The Sellout "
    t1.em.replace_with(new_tag)

# join all the strings, leaving white space but can removed with stipped_strings
strattrs="".join(['%s' %(c,) for c in t1.strings])
print "The joined string for analysis with Alchemy"
print(strattrs)

# make call to alchemy
alchemy_language = AlchemyLanguageV1(api_key='8dd8a4d53c0bbcaf8d236a3c520d362322ee4094')
call=(json.dumps(
  alchemy_language.keywords(
    strattrs),
  indent=2))
# print call to alchemy
print(call)
#parse json data
parsedj=json.loads(call)

# print top 10 ranked key words
print "top 10 ranked keywords from Alchemy API"
test = extractor(parsedj, 10)
for i in test:
    print i
