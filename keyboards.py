import telebot
#keyboard

keyboardstart = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardstart.row('Пробный период', 'Купить подписку')

#key for prob
keyboardlvlprob1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardlvlprob1.row('A1', 'A2') # A - english

keyboardtemsprob1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardtemsprob1.row('Animals', 'Apperance', 'Communication') 
keyboardtemsprob1.row('Culture', 'Food and drink', 'Functions', 'Health')
keyboardtemsprob1.row('Homes and buildings', 'Leisure','Notions')
keyboardtemsprob1.row('People','Politics and society', 'Science and technology')
keyboardtemsprob1.row('Sport','The natural world','Time and space','Travel','Work and business')
keyboardtemsprob1.row('People','Politics and society', 'Science and technology')
keyboardtemsprob1.row('Back / Назад')


keyboardanimals1 = telebot.types.ReplyKeyboardMarkup(True, True) 
keyboardanimals1.row('Animals', 'Birds', 'Fish and shellfish')

keyboardapperance1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardapperance1.row('Appearance','Body','Clothes and Fashion', 'Colours and Shapes')

keyboardcommunication1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardcommunication1.row('Language', 'Phones, email and the internet')

keyboardculture1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardculture1.row('Art', 'Film and theatre', 'Literature and writing','Music','TV, radio and news')

keyboardfoodanddrink1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardfoodanddrink1.row('Cooking and eating','Drinks','Food')

keyboardfunctions1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardfunctions1.row('Discussion and agreement','Doubt, guessing and certainty','Opinion and argument','Permission and obligation','Preferences and decisions', 'Suggestions and advica')

keyboardhealth1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardhealth1.row('Health and fitness', 'Illness','Medicine')

keyboardhomesandbuildings1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardhomesandbuildings1.row('Buildings','Gardens','Houses and hormes')

keyboardleisure1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardleisure1.row('Games and toys', 'Hobbies', 'Shopping')

keyboardnotions1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardnotions1.row('Change, cause and effect', 'Danger', 'Difficulty and failure', 'Success')

keyboardpeople1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardpeople1.row('Education','Family and relationships', 'Feelings','Life stages', 'Personal qualities')

keyboardpolitics1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardpolitics1.row('Crime and punishment', 'Law and justice','People in society', 'Politics','Religion and festivals', 'Social issues')

keyboardscience1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardscience1.row('Biology','Computers','Engineering','Math and measurement','Physics and chemistry','Scientific research')

keyboardsport1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardsport1.row('Ball and racket sports', 'Other sports','Water sports')

keyboardnatural1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardnatural1.row('Farming','Geography','Plants and trees','The environment','Weather')

keyboardtimeandspace1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardtimeandspace1.row('History', 'Space','Time')

keyboardtravel1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardtravel1.row('Holidays', 'Transport by air', 'Bus and train','Car and lorry','Transport by water')

keyboardworkandbusiness1 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardworkandbusiness1.row('Business', 'Jobs', 'Money','Working life')


keyboardtemsprob2 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardtemsprob2.row('Animals', 'Apperance', 'Communication', 'Culture', 'Food and drink', 'Functions', 'Health', 'Homes and buildings', 'Leisure','Notions','People','Politics and society', 'Science and technology','Sport','The natural world','Time and space','Travel','Work and business')

keyboard = telebot.types.ReplyKeyboardMarkup(True, True)
keyboard.row('')
#key for podpiska

keyboardlvlpod = telebot.types.ReplyKeyboardMarkup(True, True)
keyboardlvlpod.row('A1', 'A2', 'B1', 'B2', 'C1')


keyboard3 = telebot.types.ReplyKeyboardMarkup(True, True)
keyboard3.add('Meat', 'Fish', 'Dairy products', 'Cereal products','Sweets','Fruit', 'Vegetables','Things added to food', 'Drinks', 'Preparing food')

