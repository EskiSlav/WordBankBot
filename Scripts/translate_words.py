import requests
import urllib.parse
import pprint
from oxford import Word
import sqlite3

conn = sqlite3.connect('./../words.db')
curr = conn.cursor()

# words = [
#     "animal",
#     "cat",
#     "cow",
#     "dog",
#     "elephant",
#     # "horse",
#     # "lion",
#     # "mouse",
#     # "pig",
#     # "sheep",
#     # "snake",
# ]

words_table = "words_a2"

curr.execute(f"""SELECT word FROM {words_table} WHERE translation='';""")
words = curr.fetchall()
for word in words:
    uri_word = urllib.parse.quote(word[0].capitalize())
    response = requests.get(f"https://api.mymemory.translated.net/get?q={uri_word}&langpair=en|ru")
    res = response.json()
    print(res)
    best_tranlation = ""
    best_match = 0
    print("Mathches: | " + word[0] + " |")
    for match in res['matches']:
        # print("  Translation " + match['translation'], end=' ')
        # print("   - Quality: " + str(match['quality']), end=' ')
        # print("   - Match " + str(match['match']))
        if match['match'] > best_match:
            best_match = match['match']
            best_tranlation = str(match['translation'])
    print(best_tranlation)
    curr.execute(f"""UPDATE {words_table} SET translation='{best_tranlation}' WHERE word='{word[0]}'""")
conn.commit()

conn.close()
# Word.get('swimming')
# pprint.pprint(Word.pronunciations())
# print()