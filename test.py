import psycopg2
from constant import *
from pprint import pprint
from copy import deepcopy
# conn = psycopg2.connect(f"dbname=word_bank_bot user={db_user} password={db_password}")
# curr = conn.cursor()

# curr.execute("SELECT translation FROM words WHERE translation IS NULL;")

# pprint(curr.fetchall())
# conn.close()

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

l = [1,2,3,4,5,6,7,8,9,10,11,12,13]

print(split_buttons(l, 3))