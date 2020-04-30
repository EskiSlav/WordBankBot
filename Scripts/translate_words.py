import requests
import urllib.parse
import pprint
from oxford import Word
import psycopg2


db_user = 'wordbankbot'
db_password = 'AnotherOneIsBetterToStoreIn3eMemory'
connection_string = f"dbname=word_bank_bot user={db_user} password={db_password}"

conn = psycopg2.connect(connection_string)
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

table = "words"

curr.execute("""SELECT word FROM words WHERE translation IS NULL OR translation='' LIMIT 1000;""")
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
    curr.execute("""UPDATE words SET translation=%s WHERE word=%s AND translation IS NULL""", (best_tranlation, word[0],))
conn.commit()

conn.close()
# Word.get('swimming')
# pprint.pprint(Word.pronunciations())
# print()