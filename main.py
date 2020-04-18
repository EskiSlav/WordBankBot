from constant import *
from keyboards import *
import telebot
import psycopg2
import logging


def get_conn():
    conn = psycopg2.connect(connection_string)
    curr = conn.cursor()
    return curr, conn

def get_user_level(user_id):
    user_status = get_user_status(user_id)
    if len(user_status) > 2:
        level = user_status[:2].upper()
    else:
        level = user_status.upper()
    return level

def change_status(id, status):
    status = status.upper()
    curr, conn = get_conn()
    curr.execute("SELECT * FROM users WHERE user_id=%s;", (id,))
    res = curr.fetchall()
    if len(res) == 0:
        log.info("There is not suxh usedr in database")
        conn.close()
        return False
    else:
        curr.execute("UPDATE users SET status=%s WHERE user_id =%s;", (str(status), int(id),))
        conn.commit()
        conn.close()
        return True

def change_status_from_section_to_subsection(user_id):
    level = get_user_level(user_id)
    change_status(user_id, level)

def change_status_from_subsection_to_section(user_id):
    level  = get_user_level(user_id)
    status = level + '_SECTION' 
    change_status(user_id, status)

def is_user_status(id, status):
    curr, conn = get_conn()
    curr.execute("SELECT status FROM users WHERE user_id=%s", (id,))
    res = curr.fetchone()[0]
    conn.close()
    
    if not res is None:
        if res == status:
            return True
    
    return False

def get_user_status(user_id):
    curr, conn = get_conn()
    curr.execute("SELECT status FROM users WHERE user_id=%s", (user_id,))
    res = curr.fetchall()
    conn.close()
    
    return res[0][0]

def add_user_to_database(user_id, username):
    curr, conn = get_conn()
    curr.execute("SELECT id FROM users WHERE user_id=%s", (user_id,))
    if len(curr.fetchall()) == 0:
        curr.execute("INSERT INTO users(user_id, username, status) VALUES(%s,%s,NULL)", (user_id, username,))
        conn.commit()
        log.info('new user has been created: {} {}'.format(user_id, username))
    else:
        log.info('Such user already exists: {} {}'.format(user_id, username))

    conn.close()

def add_audio_to_database(user_id, message_caption, audio_id):
    caption = message_caption.split()
    level = caption[0].upper()
    caption = ' '.join(caption[1:]).upper()
    curr, conn = get_conn()
    curr.execute("SELECT audio_id FROM subthemes t LEFT JOIN levels l ON t.level_id=l.id WHERE t.theme = %s AND l.level=%s;", (caption, level,))
    res = curr.fetchone()[0]
    print(res is not None)
    if res is None:
        curr.execute("INSERT INTO audios(caption, audio_id) VALUES(%s, %s);", (caption, audio_id,))
        curr.execute("UPDATE subthemes SET audio_id=(SELECT id FROM audios WHERE audio_id=%s) WHERE theme=%s;", (audio_id, caption,))
        conn.commit()
        bot.send_message(user_id, "The audio was added successfully")
        log.info('New audio was added: User:{}, {} {}'.format(user_id, audio_id, message_caption))
    else:
        log.info('This audio was added earlier!: User:{}, {} {}'.format(user_id, audio_id, message_caption))
        bot.send_message(user_id, "This audio was added earlier!")
    conn.close()

def change_audio_in_database(user_id, message_caption, audio_id):
    caption = message_caption.split()
    level = caption[0].lower()
    caption = ' '.join(caption[1:]).upper()
    curr, conn = get_conn()
    curr.execute("SELECT * FROM audios WHERE caption=%s AND level=%s;", (caption, level,))
    res = curr.fetchall()
    if not len(res) == 0:
        curr.execute("UPDATE audios SET audio_id=%s WHERE caption=%s ;", (audio_id, caption,))
        bot.send_message(user_id, "The audio was updated successfully")
        conn.commit()
        log.info('This audio was added earlier!: User:{}, {} {}'.format(user_id, audio_id, message_caption))
    else:
        bot.send_message(user_id, "There is no such audio")
    
    conn.close()

def get_audio_id(user_id, caption):
    caption = caption.upper()
    curr, conn = get_conn()
    curr.execute("SELECT status FROM users WHERE user_id=%s",(user_id,))
    level = curr.fetchone()[0]
    curr.execute("""
        SELECT a.audio_id FROM subthemes s
        LEFT JOIN audios a ON s.audio_id=a.id 
        LEFT JOIN levels l ON s.level_id=l.id 
         WHERE s.subtheme=%s AND l.level=%s;""", (caption,level,))
    res = curr.fetchone()
    conn.close()
    return res[0] if not res is None else None  

def send_audio_name(user_id, caption):
    audio_id = get_audio_id(user_id, caption)
    if audio_id is not None:
        bot.send_audio(user_id, audio_id)
    else:
        bot.send_message(user_id, 'Sorry we deal with some troubles with sending audios, soon all will be ok =)')
        log.info('Requested audio does not exist')

def get_words(user_id, caption):
    caption = caption.upper()
    curr, conn = get_conn()
    curr.execute("SELECT status FROM users WHERE user_id=%s",(user_id,))
    level = curr.fetchone()[0]
    print(level, caption)
    curr.execute("SELECT w.word FROM words w LEFT JOIN subthemes s ON s.id=w.subtheme_id LEFT JOIN levels l ON s.level_id=l.id WHERE s.subtheme=%s AND l.level=%s", (caption,level,))
    words = curr.fetchall()
    conn.close()
    return words

def send_words(user_id, caption):
    words = get_words(user_id, caption)
    if not len(words) == 0:
        words_message = ''
        for word in words:
            words_message += word[0].capitalize() + '\n'
        bot.send_message(user_id, words_message)
    else:
        log.info('Requested theme does not exist')

def selecting_subthemes(user_id):
    for status in subsection_statuses:
        if(is_user_status(user_id, status)):
            return True
    return False

def selecting_themes(user_id):
    for status in section_statuses:
        if(is_user_status(user_id, status)):
            return True
    return False

def get_subthemes(user_id, theme):
    curr, conn = get_conn()
    conn.close()

def generate_subthemes_keyboard(user_id, theme):
    keyboard = telebot.types.ReplyKeyboardMarkup(True, True)
    theme = theme.upper()
    level = get_user_level(user_id)
    curr, conn = get_conn()
    curr.execute("""
        SELECT subtheme FROM subthemes s 
        LEFT JOIN levels l ON s.level_id=l.id 
        LEFT JOIN themes t ON s.theme_id=t.id
         WHERE t.theme =%s AND l.level=%s """, (theme, level,))
    subthemes = curr.fetchall()
    conn.close()
    for subtheme in subthemes:
        keyboard.add(subtheme[0].lower().capitalize())
    keyboard.add('Back')
    return keyboard

def generate_themes_keyboard(user_id):
    keyboard = telebot.types.ReplyKeyboardMarkup(True, True, row_width=4)
    level = get_user_level(user_id)
    curr, conn = get_conn()
    curr.execute("""SELECT theme FROM themes t LEFT JOIN levels l ON t.level_id=l.id WHERE l.level=%s""", (level,))
    themes = curr.fetchall()
    conn.close()
    for theme in themes:
        keyboard.add(theme[0].lower().capitalize())
    keyboard.add('Back')
    return keyboard

def generate_level_keyboard(user_id):
    keyboard = telebot.types.ReplyKeyboardMarkup(True, True, row_width=6)
    keyboard.row('A1','A2','B1','B2','C1','C2')
    return keyboard

def is_theme_exist(user_id, theme):
    theme = theme.upper()
    curr, conn = get_conn()
    level = get_user_level(user_id)
    curr.execute("SELECT * FROM themes t LEFT JOIN levels l ON t.level_id=l.id WHERE t.theme=%s AND l.level=%s;", (theme, level,))
    res = curr.fetchall()
    conn.close()
    if not len(res) == 0:
        return True
    return False



#---------
bot = telebot.TeleBot(TOKEN)
logging.basicConfig(filename="log.txt", level=logging.INFO)
log = logging.getLogger('User Creator')
#---------

@bot.message_handler(commands=['start'])
def start_message(message):
    bot.send_message(message.chat.id, 'Привет, мое предназначение помочь тебе выучить иностраный язык. Твоему вниманию предоставлены разные уровни языка и разные темы. Как будет проходить твое обучение подован, я тебе пришлю запись со словами и ихними переводами, а ты просто включаешь их и слушаешь. Вроде бы ничего сложного;)', reply_markup=keyboardstart)
    add_user_to_database(message.chat.id, message.chat.username)
    change_status(message.chat.id, MAIN_MENU)

@bot.message_handler(commands=['addaudio'], func=lambda message: message.chat.id in administrators_id)
def add_audio(message):
    bot.send_message(message.chat.id, "Send an audio file you want to add to the database")
    change_status(message.chat.id, ADDING_AUDIO)

@bot.message_handler(commands=['changeaudio'], func=lambda message: message.chat.id in administrators_id)
def set_change_audio_status(message):
    bot.send_message(message.chat.id, "Send audio with caption")
    change_status(message.chat.id, CHANGING_AUDIO)
    

@bot.message_handler(content_types=['audio'], func=lambda message: is_user_status(message.chat.id, ADDING_AUDIO))
def ff(message):
    if(message.caption is not None and len(message.caption.split()) > 1):
        add_audio_to_database(message.chat.id, message.caption, message.audio.file_id)
        change_status(message.chat.id, 'None')
    else:
        bot.send_message(message.chat.id, "You must specify a name")
    

@bot.message_handler(content_types=['audio'], func=lambda message: is_user_status(message.chat.id, CHANGING_AUDIO))
def change_audio(message):
    if message.caption is not None:
        change_audio_in_database(message.chat.id, message.caption, message.audio.file_id)
        change_status(message.chat.id, 'None')
    else:
        bot.send_message(message.chat.id, "You must specify a name")

# SEND SUBTHEMES
@bot.message_handler(content_types=['text'], func=lambda message: selecting_themes(message.chat.id))
def send_subsection_keyboard(message):
    if(is_theme_exist(message.chat.id, message.text)):
        change_status_from_section_to_subsection(message.chat.id)
        bot.send_message(message.chat.id, "Choose subsection:", reply_markup=generate_subthemes_keyboard(message.chat.id, message.text))
    else:
        if message.text.lower() == 'back':
            change_status(message.chat.id, MAIN_MENU)
            bot.send_message(message.chat.id, "Chose level", reply_markup=generate_level_keyboard(message.chat.id))
        else:
            bot.send_message(message.chat.id, "Such theme does not exists, sorry =(")


@bot.message_handler(content_types=['text'], func=lambda message: selecting_subthemes(message.chat.id))
def subtheme_handler(message):
    if message.text.lower() == 'back':
        change_status_from_subsection_to_section(message.chat.id)
        bot.send_message(message.chat.id, "Select theme:", reply_markup=generate_themes_keyboard(message.chat.id))
    else: 
        send_words(message.chat.id, message.text)
        send_audio_name(message.chat.id, message.text)


@bot.message_handler(content_types=['text'], func=lambda message: is_user_status(message.chat.id, MAIN_MENU))
def main_menu_handler(message):
    msg_text = message.text.lower()
    if msg_text == 'пробный период':
        bot.send_message(message.chat.id, 'Выбери свой уровень:', reply_markup=keyboardlvlprob1)
    elif msg_text == 'a1':
        change_status(message.chat.id, SELECTING_SECTION_A1)
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=generate_themes_keyboard(message.chat.id))
    elif msg_text == 'a2':
        change_status(message.chat.id, SELECTING_SECTION_A2)
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=generate_themes_keyboard(message.chat.id))
    elif msg_text == 'b1':
        change_status(message.chat.id, SELECTING_SECTION_B1)
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=generate_themes_keyboard(message.chat.id))
    

@bot.message_handler(content_types=['text'])
def send_text(message):
    msg_text = message.text.lower()
    
    if message.text.lower() == 'animals':
        bot.send_message(message.chat.id, 'Выбери подтему:', reply_markup=keyboardanimals1)
    elif message.text.lower() == 'apperance':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardapperance1)    
    elif message.text.lower() == 'communication':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardcommunication1)
    elif message.text.lower() == 'culture':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardculture1)
    elif message.text.lower() == 'food and drink':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardfoodanddrink1)    
    elif message.text.lower() == 'functions':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardfunctions1)
    elif message.text.lower() == 'health':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardhealth1)    
    elif message.text.lower() == 'homes and buildings':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardhomesandbuildings1)
    elif message.text.lower() == 'leisure':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardleisure1)    
    elif message.text.lower() == 'notions':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardnotions1)    
    elif message.text.lower() == 'people':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardpeople1)
    elif message.text.lower() == 'politics and society':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardpolitics1)
    elif message.text.lower() == 'science and technology':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardscience1)
    elif message.text.lower() == 'sport':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardsport1)
    elif message.text.lower() == 'the natural world':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardnatural1)
    elif message.text.lower() == 'time and space':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardtimeandspace1)
    elif message.text.lower() == 'travel':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardtravel1)
    elif message.text.lower() == 'work and business':
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardworkandbusiness1)

    elif msg_text == 'a2' or msg_text == 'а2': 
        bot.send_message(message.chat.id, "This section is not working yet. Please choose something else", reply_markup=keyboardlvlprob1)
        change_status(message.chat.id, SELECTING_SECTION_A2)
   
    #koniec probnyj period

    elif message.text.lower() == 'b1':
        bot.send_message(message.from_user.id, 'Как это работает. Ты слушаешь английские слова, запоминаешь перевод и на повторном прослушивании пытаешься их перевести. Все очень просто, попробуй!', reply_markup=keyboard3)
    elif message.text.lower() == 'b2':
        send_audio_name(message.chat.id, 'rick-astley')
    elif message.text.lower() == 'c1':
        send_audio_name(message.chat.id, 'rick-astley')
    elif message.text.lower() == 'back':
        bot.send_message(message.chat.id, 'Выбери свой уровень:', reply_markup=keyboardstart)
    elif message.text.lower() == 'meat':
        bot.send_message(message.chat.id, 'MEAT:\nbacon - бекон\nbeef - говядина\nchicken - курица\nham - ветчина\nmeat - мясо\npork - свинина\nsausage - сосиски\nturkey - индейка')     
        bot.send_chat_action(message.from_user.id, 'upload_audio')
        send_audio_name(message.chat.id, 'meat')
    elif message.text.lower() == 'fish':
        send_audio_name(message.chat.id, 'fish')
    elif message.text.lower() == 'dairy products':
        send_audio_name(message.chat.id, 'dairy-products')
    elif message.text.lower() == 'cereal products':
        send_audio_name(message.chat.id, 'cereal-products')
    elif message.text.lower() == 'sweets':
        send_audio_name(message.chat.id, 'sweets')
    elif message.text.lower() == 'fruits':
        send_audio_name(message.chat.id, 'fruits')
    elif message.text.lower() == 'назад':
        bot.send_message(message.chat.id, 'Главное меню:', reply_markup=keyboardstart)
    else:
        bot.send_message(message.chat.id, 'Error!', reply_markup=keyboardstart)


bot.polling(none_stop=True)

