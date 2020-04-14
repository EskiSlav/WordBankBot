import requests
import urllib.parse
import pprint
from oxford import Word
words = [
    "animal",
    "cat",
    "cow",
    "dog",
    "elephant",
    "horse",
    "lion",
    "mouse",
    "pig",
    "sheep",
    "snak",
]
# for word in words:
#     uri_word = urllib.parse.quote(word.capitalize())
#     response = requests.get(f"https://api.mymemory.translated.net/get?q={uri_word}&langpair=en|ru")
#     d = response.json()
#     print("Mathches: | " + word + " |")
#     for match in d['matches']:
#         print("  Translation " + match['translation'])
#         print("   - Quality: " + str(match['quality']), end=' ')
#         print("   - Match" + str(match['match']))

Word.get('swimming')
pprint.pprint(Word.pronunciations())
print()