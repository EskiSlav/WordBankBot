import sqlite3

conn = sqlite3.connect("../words.db")
curr = conn.cursor()

theme_table     = "themes_b1"
word_type_table = "word_type"
words_table     = "words_b1" 

def exit_script():
    print("Exiting script...")
    exit()

def check_tables_correct():
    if input (f"[!] Is this correct Theme table? {theme_table} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct Word table? {words_table} (Y/N) ").lower() != 'y':
        exit_script()

    if input (f"[!] Is this correct Word types table? {word_type_table} (Y/N) ").lower() != 'y':
        exit_script()

def add_theme(theme):
    curr.execute(f"SELECT * FROM {theme_table} WHERE theme='{theme}'")
    res = curr.fetchall()
    if len(res):
        print("Such theme already exists: " + theme)
        return 1
    else:
        curr.execute(f"INSERT INTO {theme_table}(theme) VALUES ('{theme}')")
        conn.commit()
        print("Added theme: " + theme)
        return 0 

def add_type(word_type):
    curr.execute(f"SELECT * FROM {word_type_table} WHERE type='{word_type}'", )
    res = curr.fetchall()
    if len(res):
        pass
    else:
        curr.execute(f"INSERT INTO {word_type_table}(type) VALUES ('{word_type}')" )
        conn.commit()
        print("Added type: " + word_type)

def add_word(word, theme, word_type):
    curr.execute(f"""INSERT INTO {words_table}(word, theme_id, type_id)
     VALUES('{word}', (SELECT id FROM {theme_table} WHERE theme='{theme}'), 
     (SELECT id FROM {word_type_table} WHERE type='{word_type}')
     )""")
    conn.commit()
    print(f"  Added row {word}, {theme}, {word_type}")

def create_table_themes():
    curr.execute(f"""CREATE TABLE IF NOT EXISTS {theme_table}(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        theme TEXT NOT NULL UNIQUE
    );""")
    conn.commit()

def create_table_type():
    curr.execute(f"""CREATE TABLE IF NOT EXISTS {word_type_table}(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL UNIQUE   
    )""")
    conn.commit()

def create_table_words():
    curr.execute(f"""CREATE TABLE IF NOT EXISTS {words_table} (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT NOT NULL, 
        theme_id INTEGER NOT NULL,
        type_id INTEGER NOT NULL,
        translation TEXT,
        CONSTRAINT fk_themes
         FOREIGN KEY(theme_id) 
         REFERENCES {theme_table}(id),
        CONSTRAINT fk_types
         FOREIGN KEY(type_id)
         REFERENCES {word_type_table}(id)
    )""")
    conn.commit()

def fill_db(filename):
    words = open(filename, 'r')
    theme = None
    while(not (l := words.readline()) == ''):
        l = l.split()

        if not len(l):
            continue

        if l[len(l)-1][-2:] in ['A1', 'A2', 'B1', 'B2', 'C1', 'C2']:
            if theme is None:
                print("No theme!")
                break
            word = ' '.join(l[:-1])
            word_type = l[-1][:len(l[-1])-2]
            add_type(word_type)
            add_word(word, theme, word_type)
        else:
            theme = " ".join(l)
            add_theme(theme)

check_tables_correct()
create_table_type()
create_table_themes()
create_table_words()

# fill_db("./../Words/wordsA2.txt")
fill_db("./../Words/wordsB1.txt")