from constant import *
from keyboards import *
import telebot
import psycopg2
import logging

print("bot started!")

def beautify_fetchall(lst):
    for i, subtheme in enumerate(lst):
        lst[i] = subtheme[0].lower().capitalize()

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

def split_buttons(buttons_list, rows=2):
    buttons_placement = []
    counter = -1
    for i, button in enumerate(buttons_list):
        if i % rows == 0:
            counter+=1
            buttons_placement.append([])
        buttons_placement[counter].append(button)

    if len(buttons_placement) > 1:
        if len(buttons_placement[-2]) - len(buttons_placement[-1])  > 1:
            last_row = buttons_placement[-1]
            before_last_row = buttons_placement[-2]
            full_array = last_row + before_last_row
            sum_len = len(full_array)
            less_half = int(sum_len/2)
            bigger_half = sum_len - less_half
            buttons_placement[-1] = []
            buttons_placement[-2] = []

            for i in range(bigger_half):
                buttons_placement[-2].append(full_array[i])
            
            for i in range(bigger_half, sum_len):
                buttons_placement[-1].append(full_array[i])

    return buttons_placement

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
    curr.execute("""
        SELECT audio_id FROM subthemes st 
        LEFT JOIN levels l ON st.level_id=l.id 
        WHERE st.subtheme = %s AND l.level=%s;""", (caption, level,))
    res = curr.fetchone()[0]
    if res is None:
        curr.execute("""
            INSERT INTO audios(caption, audio_id, level_id) 
            VALUES(%s, %s, (SELECT id FROM levels WHERE level=%s));""", (caption, audio_id, level,))
        curr.execute("UPDATE subthemes SET audio_id=(SELECT id FROM audios WHERE audio_id=%s) WHERE subtheme=%s;", (audio_id, caption,))
        conn.commit()
        bot.send_message(user_id, "The audio was added successfully", reply_markup=generate_level_keyboard(user_id))
        log.info('New audio was added: User:{}, {} {}'.format(user_id, audio_id, message_caption))
    else:
        log.info('This audio was added earlier!: User:{}, {} {}'.format(user_id, audio_id, message_caption))
        bot.send_message(user_id, "This audio was added earlier!", reply_markup=generate_level_keyboard(user_id))
    conn.close()

def change_audio_in_database(user_id, message_caption, audio_id):
    caption = message_caption.split()
    level = caption[0].upper()
    caption = ' '.join(caption[1:]).upper()
    curr, conn = get_conn()
    curr.execute("""
        SELECT a.id FROM audios a
        LEFT JOIN levels l ON l.id=a.level_id
         WHERE a.caption=%s AND l.level=%s;""", (caption, level,))
    res = curr.fetchall()
    if not len(res) == 0:
        curr.execute("""
            UPDATE audios SET audio_id=%s 
            WHERE caption=%s AND level_id=(SELECT id FROM levels WHERE level=%s);""", (audio_id, caption, level,))
        conn.commit()
        bot.send_message(user_id, "The audio was updated successfully", reply_markup=generate_level_keyboard(user_id))
        # log.info('This audio was added earlier!: User:{}, {} {}'.format(user_id, audio_id, message_caption))
    else:
        bot.send_message(user_id, "There is no such audio", reply_markup=generate_level_keyboard(user_id))
    
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
        # bot.send_message(user_id, 'Sorry we deal with some troubles with sending audios, soon all will be ok =)')
        log.info('Requested audio does not exist:  subtheme: ' + caption)

def get_words(user_id, caption):
    caption = caption.upper()
    curr, conn = get_conn()
    curr.execute("SELECT status FROM users WHERE user_id=%s",(user_id,))
    level = curr.fetchone()[0]
    curr.execute("""
        SELECT t.theme, st.subtheme FROM themes t 
        LEFT JOIN subthemes st ON st.theme_id=t.id
        LEFT JOIN levels l ON l.id=st.level_id 
        WHERE st.subtheme=%s AND l.level=%s """, (caption,level,))
    contents = curr.fetchone()
    curr.execute("""
        SELECT w.word FROM words w 
        LEFT JOIN subthemes s ON s.id=w.subtheme_id 
        LEFT JOIN levels l ON s.level_id=l.id
        WHERE s.subtheme=%s AND l.level=%s""", (caption,level,))
    words = curr.fetchall()
    
    beautify_fetchall(words)
    words = list(set(words))
    words.sort()
    conn.close()
    return contents, words

def send_words(user_id, caption):
    contents, words = get_words(user_id, caption)
    
    if not len(words) == 0:
        words_message = '<b>' + contents[0] + '\n' + contents[1].lower().capitalize() + '</b>' + '\n\n'
        for word in words:
            words_message += word + '\n'
        bot.send_message(user_id, words_message, parse_mode='HTML')
    else:
        bot.send_message(user_id, 'Такой темы не существует 😔 \nВыбери другую:')
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
    beautify_fetchall(subthemes)
    subthemes.sort()
    rows = split_buttons(subthemes, 2)
    for row in rows:
        if len(row) == 3:
            keyboard.add(row[0], row[1], row[2])
        if len(row) == 2:
            keyboard.add(row[0], row[1])
        if len(row) == 1:
            keyboard.add(row[0])

    keyboard.add('Back')
    return keyboard

def generate_themes_keyboard(user_id):
    keyboard = telebot.types.ReplyKeyboardMarkup(True, True, row_width=4)
    level = get_user_level(user_id)
    curr, conn = get_conn()
    curr.execute("""SELECT theme FROM themes t LEFT JOIN levels l ON t.level_id=l.id WHERE l.level=%s""", (level,))
    themes = curr.fetchall()
    conn.close()
    rows = split_buttons(themes, 2)
    for row in rows:
        if len(row) == 3:
            keyboard.add(row[0][0],row[1][0],row[2][0])
        if len(row) == 2:
            keyboard.add(row[0][0],row[1][0])
        if len(row) == 1:
            keyboard.add(row[0][0])

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
    bot.send_message(message.chat.id, 'Привет, мое предназначение помочь тебе выучить иностраный язык. Твоему вниманию предоставлены разные уровни языка и разные темы. Как будет проходить твое обучение подован, я тебе пришлю запись со словами и ихними переводами, а ты просто включаешь их и слушаешь. Вроде бы ничего сложного;)', reply_markup=generate_level_keyboard(message.chat.id))
    add_user_to_database(message.chat.id, message.chat.username)
    change_status(message.chat.id, MAIN_MENU)

# --- AUDIO SECTION ---------------------

@bot.message_handler(commands=['addaudio'], func=lambda message: message.chat.id in administrators_id)
def add_audio(message):
    bot.send_message(message.chat.id, "Отправь аудио, которое надо добавить в базу данных.\n\n Формат:\n Аудио файл + Надпись: A1 Animals [level subtheme]")
    change_status(message.chat.id, ADDING_AUDIO)

@bot.message_handler(commands=['changeaudio'], func=lambda message: message.chat.id in administrators_id)
def set_change_audio_status(message):
    bot.send_message(message.chat.id, "Отправь аудио, которое надо изменить в базе данных.\n\n Формат:\n Аудио файл + Надпись: A1 Animals [level subtheme]")
    change_status(message.chat.id, CHANGING_AUDIO)
    

@bot.message_handler(content_types=['audio'], func=lambda message: is_user_status(message.chat.id, ADDING_AUDIO))
def add_audio_handler(message):
    """
    This code work when admin is adding a new audio file to the subtheme
    """
    if(message.caption is not None and len(message.caption.split()) > 1):
        add_audio_to_database(message.chat.id, message.caption, message.audio.file_id)
        change_status(message.chat.id, MAIN_MENU)
    else:
        bot.send_message(message.chat.id, "Нужно указать название аудио: \n\n Формат:\n Аудио файл + Надпись: A1 Animals [level subtheme]")
    

@bot.message_handler(content_types=['audio'], func=lambda message: is_user_status(message.chat.id, CHANGING_AUDIO))
def change_audio(message):
    """
    This section works when admin is changing audio to the subtheme
    """
    if message.caption is not None:
        change_audio_in_database(message.chat.id, message.caption, message.audio.file_id)
        change_status(message.chat.id, MAIN_MENU)
    else:
        bot.send_message(message.chat.id, "Нужно указать название аудио: \n\n Формат:\n Аудио файл + Надпись: A1 Animals [level subtheme]")

# ------------------------------------

@bot.message_handler(content_types=['text'], func=lambda message: selecting_themes(message.chat.id))
def section_handler(message):
    """
    Section button handler that sends subsections
    """
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
    """
    Subsection button handler that sends words and audios to user
    """
    if message.text.lower() == 'back':
        change_status_from_subsection_to_section(message.chat.id)
        bot.send_message(message.chat.id, "Select theme:", reply_markup=generate_themes_keyboard(message.chat.id))
    else: 
        send_words(message.chat.id, message.text)
        send_audio_name(message.chat.id, message.text)


@bot.message_handler(content_types=['text'], func=lambda message: is_user_status(message.chat.id, MAIN_MENU))
def main_menu_handler(message):
    """
    This section handles keybord with Levels
    """
    msg_text = message.text.lower()
    if msg_text == 'пробный период':
        bot.send_message(message.chat.id, 'Выбери свой уровень:', reply_markup=generate_level_keyboard(message.chat.id))
    elif msg_text == 'купить подписку':
        bot.send_message(message.chat.id, 'Выбери свой уровень', reply_markup=generate_level_keyboard(message.chat.id))
    else:
        if msg_text == 'a1':
            change_status(message.chat.id, SELECTING_SECTION_A1)
        elif msg_text == 'a2':
            change_status(message.chat.id, SELECTING_SECTION_A2)
        elif msg_text == 'b1':
            change_status(message.chat.id, SELECTING_SECTION_B1)
        elif msg_text == 'b2':
            change_status(message.chat.id, SELECTING_SECTION_B2)
        elif msg_text == 'c1':
            change_status(message.chat.id, SELECTING_SECTION_C1)
        else:
            bot.send_message(message.chat.id, 'Выбери уровень', reply_markup=generate_level_keyboard(message.chat.id))
            return
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=generate_themes_keyboard(message.chat.id))


bot.polling(none_stop=True, timeout=1)
