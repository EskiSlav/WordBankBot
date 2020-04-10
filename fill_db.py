import sqlite3

conn = sqlite3.connect("Newwords.db")
curr = conn.cursor()

def add_theme(theme):
    curr.execute(f"SELECT * FROM themes_a1 WHERE theme='{theme}'")
    res = curr.fetchall()
    if len(res):
        print("Such theme already exists: " + theme)
        return 1
    else:
        curr.execute(f"INSERT INTO themes_a1(theme) VALUES ('{theme}')")
        conn.commit()
        print("Added theme: " + theme)
        return 0 

def add_type(word_type):
    curr.execute(f"SELECT * FROM word_types WHERE type='{word_type}'", )
    res = curr.fetchall()
    if len(res):
        pass
    else:
        curr.execute(f"INSERT INTO word_types(type) VALUES ('{word_type}')" )
        conn.commit()
        print("Added type: " + word_type)

def add_word(word, theme, word_type):
    curr.execute(f"""INSERT INTO Words_A1 (word, theme_id, type_id)
     VALUES('{word}', (SELECT id FROM themes_a1 WHERE theme='{theme}'), 
     (SELECT id FROM word_types WHERE type='{word_type}')
     )""")
    conn.commit()
    print(f"  Added row {word}, {theme}, {word_type}")

def create_table_themes_a1():
    curr.execute("""CREATE TABLE IF NOT EXISTS themes_a1(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        theme TEXT NOT NULL UNIQUE
    );""")
    conn.commit()

def create_table_type():
    curr.execute("""CREATE TABLE IF NOT EXISTS word_types(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        type TEXT NOT NULL UNIQUE   
    )""")
    conn.commit()

def create_table_words_a1():
    curr.execute("""CREATE TABLE IF NOT EXISTS words_a1 (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        word TEXT NOT NULL, 
        theme_id INTEGER NOT NULL,
        type_id INTEGER NOT NULL,
        CONSTRAINT fk_themes
         FOREIGN KEY(theme_id) 
         REFERENCES Themes_A1(id),
        CONSTRAINT fk_types
         FOREIGN KEY(type_id)
         REFERENCES word_types(id)
    )""")
    conn.commit()



words = open("Words/words.txt", 'r')

endings = [
    'nounA1',
    'verbA1',
    'adjectiveA1',
    'exclamationA1',
    'conjunctionA1',
    'determinerA1',
    'prepositionA1'
]

create_table_type()
create_table_themes_a1()
create_table_words_a1()
theme = None
while(not (l := words.readline()) == ''):
    l = l.split()

    if not len(l):
        continue

    if l[len(l)-1][-2:] == 'A1':
        if theme is None:
            print("No theme!")
            break
        word_type = l[-1]
        add_type(word_type)
        add_word(' '.join(l[:len(l)-1]),theme,word_type)
        
    else:
        theme = " ".join(l)
        add_theme(theme)
