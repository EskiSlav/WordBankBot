import psycopg2

db_user = 'wordbankbot'
db_password = 'AnotherOneIsBetterToStoreIn3eMemory'
connection_string = f"dbname=word_bank_bot user={db_user} password={db_password}"

conn = psycopg2.connect(connection_string)
curr = conn.cursor()

# level = input("Enter level (A1, A2, ..., C2): ")
# level = level.lower()
levels = ['A1','A2','B1','B2','C1','C2']
themes_table     = "themes"
subthemes_table  = "subthemes"
word_types_table = "word_types"
words_table      = "words"
audios_table     = "audios"
levels_table     = "levels"
word_list        = "../Words/wordsB1.txt"

def exit_script():
    print("Exiting script...")
    exit()

def check_tables_correct():
    if input (f"[!] Is this correct word list path? {word_list} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct Theme table? {themes_table} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct Word table? {words_table} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct Word types table? {word_types_table} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct audio table? {audios_table} (Y/N) ").lower() != 'y':
        exit_script()

def add_theme(theme, level):
    curr.execute("SELECT * FROM themes t LEFT JOIN levels l ON t.level_id=l.id WHERE t.theme=%s AND l.level=%s;", (theme,level,))
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute("""INSERT INTO themes(theme,level_id) VALUES(%s, (SELECT id FROM levels WHERE level=%s));""", (theme, level,))
        print("Added theme: " + theme)

def add_subtheme(subtheme, theme, level):
    curr.execute("""
        SELECT * FROM subthemes s
        LEFT JOIN themes t ON s.theme_id=t.id
        LEFT JOIN levels l ON s.level_id=l.id
         WHERE s.subtheme=%s AND t.theme=%s AND l.level=%s""", (subtheme, theme, level,))
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute("""
            INSERT INTO subthemes(subtheme,theme_id,level_id) 
            VALUES(%s, 
            (SELECT t.id FROM themes t LEFT JOIN levels l ON t.level_id=l.id WHERE t.theme=%s AND l.level=%s),
            (SELECT id FROM levels WHERE level=%s))""", (subtheme,theme,level,level,))
        print("  Added subtheme: " + subtheme)

def add_word_type(word_type):
    curr.execute("SELECT * FROM word_types WHERE type=%s", (word_type,))
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute("INSERT INTO word_types(type) VALUES(%s)", (word_type,))
        print("Added word type: " + word_type)

def add_word(word, subtheme, theme, word_type, level):
    curr.execute("""
        SELECT * FROM words w
        LEFT JOIN levels l      ON w.level_id=l.id
        LEFT JOIN word_types wt ON w.type_id=wt.id
        LEFT JOIN subthemes st  ON w.subtheme_id=st.id
         WHERE wt.type=%s AND l.level=%s AND st.subtheme=%s AND w.word=%s""", (word_type, level, subtheme, word,))
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute("""
            INSERT INTO words(word,type_id,subtheme_id,level_id) 
            VALUES(%s, (SELECT id FROM word_types WHERE type=%s),
            (SELECT s.id FROM subthemes s 
            LEFT JOIN levels l ON l.id=s.level_id 
            LEFT JOIN themes t ON t.id=s.theme_id
            WHERE s.subtheme=%s AND l.level=%s AND t.theme=%s),
            (SELECT id FROM levels WHERE level=%s))""", (word, word_type, subtheme, level,theme, level,))
        print("   - Added word: " + word + " | theme: " + subtheme + " | word type: " + word_type, level)

def add_level(level):
    curr.execute("SELECT * FROM levels WHERE level=%s", (level,))
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute("INSERT INTO levels(level) VALUES(%s)", (level,))
        print("Added level: " + level)

def fill_db():
    words = open(word_list, 'r')
    theme      = None
    subtheme   = None
    word       = None
    word_type  = None
    turn       = 'subtheme'
    while(not (l := words.readline()) == ''):
        l = l.split()

        if not len(l):
            continue

        level = l[-1][-2:]
        if level in levels:
            add_level(level)

            if turn == 'theme':
                add_subtheme(subtheme, theme, level)
                turn = 'subtheme'

            if turn == 'add both':
                add_theme(theme, level)
                add_subtheme(subtheme, theme, level)
                turn = 'subtheme'

            word = ' '.join(l[:-1])
            word_type = l[-1][:-2]

            
            add_word_type(word_type)
            add_word(word, subtheme, theme, word_type, level)
        else:

            if turn == 'theme':
                theme = subtheme
                subtheme = ' '.join(l)
                turn = 'add both'

            if turn == 'subtheme':
                subtheme = ' '.join(l)
                turn = 'theme'

        
        
    


# check_tables_correct()

fill_db()
conn.commit()
conn.close()