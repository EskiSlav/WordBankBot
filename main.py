import telebot
from consant import *
import sqlite3
import keyboards

ADDING_AUDIO = "ADDING AUDIO"
CHANGING_AUDIO = "CHANGING_AUDIO"

def get_conn():
    conn = sqlite3.connect(database_path)
    curr = conn.cursor()
    return curr, conn


def change_status(id, status):
    curr, conn = get_conn()
    curr.execute(f"SELECT * FROM administrators WHERE user_id= ?;", [id])
    res = curr.fetchall()
    if len(res) == 0:
        print("User is not an administrator")
        conn.close()
        return False
    else:
        curr.execute("UPDATE administrators SET status = ? WHERE user_id = ?;", [str(status), int(id)])
        conn.commit()
        conn.close()
        return True

def is_user_status(id, status):
    curr, conn = get_conn()
    curr.execute(f"SELECT status FROM administrators WHERE user_id = ?", [id])
    res = curr.fetchall()
    conn.close()
    
    if len(res) == 0:
        print("User is not an administrator")
    else:
        if res[0][0] == status:
            return True
    
    return False

def add_audio_to_database(user_id, caption, file_id):
    curr, conn = get_conn()
    curr.execute("SELECT * FROM audio WHERE audio_id = ? or name = ?;", [file_id, caption.lower()])
    res = curr.fetchall()
    if len(res) == 0:
        curr.execute(f"INSERT INTO audio(name, audio_id, user_id) VALUES(?, ?, ?);", [caption.lower(), file_id, user_id])
        bot.send_message(user_id, "The audio was added successfully")
        conn.commit()
    else:
        bot.send_message(user_id, "This audio was added earlier!")
    
    
    conn.close()

def change_audio_in_database(user_id, caption, file_id):
    curr, conn = get_conn()
    curr.execute("SELECT * FROM audio WHERE name = ?;", [caption.lower()])
    res = curr.fetchall()
    if not len(res) == 0:
        curr.execute(f"UPDATE audio SET audio_id = ?, user_id = ? WHERE name = ?;", [file_id, user_id, caption.lower()])
        bot.send_message(user_id, "The audio was updated successfully")
        conn.commit()
    else:
        bot.send_message(user_id, "There is no such audio")
    
    conn.close()

def get_audio_id(caption):
    curr, conn = get_conn()
    curr.execute("SELECT audio_id FROM audio WHERE name = ?;", [caption])
    res = curr.fetchall()
    conn.close()

    return res[0][0] if not len(res) == 0 else None  

def send_audio_name(user_id, caption):
    audio_id = get_audio_id(caption.lower())
    if audio_id is not None:
        bot.send_audio(user_id, audio_id)
    else:
        bot.send_message(user_id, 'Sorry we deal with some troubles, soon all will be ok =)')
        print('No such audio in database')

# curr, conn = get_conn()
# curr.execute("CREATE TABLE IF NOT EXISTS audio(id INTEGER PRIMARY KEY, name TEXT NOT NULL, audio_id TEXT NOT NULL, chat_id INT NOT NULL);")

bot = telebot.TeleBot(TOKEN)


#start



@bot.message_handler(commands=['start'])
def start_message(message):
    bot.send_message(message.chat.id, 'Привет, мое предназначение помочь тебе выучить иностраный язык. Твоему вниманию предоставлены разные уровни языка и разные темы. Как будет проходить твое обучение подован, я тебе пришлю запись со словами и ихними переводами, а ты просто включаешь их и слушаешь. Вроде бы ничего сложного;)', reply_markup=keyboardstart)

#messages

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
    if(message.caption is not None):
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


@bot.message_handler(content_types=['text'])
def send_text(message):
    print(message.forward_from_message_id, message.message_id)
    #probnij period
    if message.text.lower() == 'пробный период':
        bot.send_message(message.chat.id, 'Выбери свой уровень:', reply_markup=keyboardlvlprob)
        # bot.forward_message(message.chat.id, '-1001304645013', '2')

    elif message.text.lower() == 'а1': #а русская
        bot.send_message(message.chat.id, 'Выбери тему:', reply_markup=keyboardtemsprob1)
    elif message.text.lower() == 'animals':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardanimals1)
    elif message.text.lower() == 'apperance':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardapperance1)    
    elif message.text.lower() == 'communication':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardcommunication1)
    elif message.text.lower() == 'culture':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardculuture1)
    elif message.text.lower() == 'food and drink':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardfoodanddrink1)    
    elif message.text.lower() == 'functions':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardfunctions1)
    elif message.text.lower() == 'health':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardhealth1)    
    elif message.text.lower() == 'homes and buildings':
        bot.send_message(message.caht.id, 'Выбери тему:', reply_markup=keyboardhomesandbuildings1)
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


    


    elif message.text.lower() == 'а2': #а русская
        send_audio_name(message.chat.id, 'rick-astley')
   
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
        # audio = open("C:/Users/root/Desktop/Meat.mp3", 'rb')
        bot.send_chat_action(message.from_user.id, 'upload_audio')
        send_audio_name(message.chat.id, 'meat')
        # bot.send_audio(message.from_user.id, audio)
        # audio.close()
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