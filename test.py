import psycopg2
from constant import *
from pprint import pprint
conn = psycopg2.connect(f"dbname=word_bank_bot user={db_user} password={db_password}")
curr = conn.cursor()

curr.execute("SELECT status FROM users WHERE id=%s;", (2,))

pprint(curr.fetchone()[0])
conn.close()

def add_theme(theme):
    curr.execute("SELECT * FROM %s LEFT JOIN %s WHERE theme=%s", (themes_table,levels_table, theme,))
    res = curr.fetchall()
    if len(res):
        print("Such theme already exists: " + theme)
        return 1
    else:
        curr.execute("INSERT INTO %s (theme) VALUES (%s)", (themes_table, theme,))
        conn.commit()
        print("Added theme: " + theme)
        return 0 

def add_type(word_type):
    curr.execute("SELECT * FROM %s WHERE type=%s",(word_types_table, word_type,) )
    res = curr.fetchall()
    if len(res):
        pass
    else:
        curr.execute("INSERT INTO %s (type) VALUES (%s)", (word_types_table, word_type) )
        conn.commit()
        print("Added type: " + word_type)

def add_word(word, theme, word_type):
    curr.execute("""INSERT INTO %s(word, theme_id, type_id)
     VALUES(%s, (SELECT id FROM %s WHERE theme=%s), 
     (SELECT id FROM %s WHERE type=%s)
     );""", (words_table, word, themes_table, theme, word_types_table, word_type,))
    conn.commit()
    print(f"  Added row {word}, {theme}, {word_type}")


ALTER SEQUENCE subthemes_id_seq RESTART;
ALTER SEQUENCE words_id_seq RESTART;
ALTER SEQUENCE themes_id_seq RESTART;
ALTER SEQUENCE levels_id_seq RESTART;
ALTER SEQUENCE word_types_id_seq RESTART;
