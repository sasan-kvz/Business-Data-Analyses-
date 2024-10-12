import re
import asyncio
import sqlite3
from telethon.sync import TelegramClient
from telethon.events import NewMessage
from datetime import datetime

api_id = '28484894'
api_hash = 'a02dbfd715e5c8bab56b8db9371ff099'
group_id = 'https://t.me/+3zKxDUHSxjcyMzk8'  # آیدی گروه تلگرامی را وارد کنید

# اتصال به پایگاه داده SQLite
conn = sqlite3.connect('transactions.db')
c = conn.cursor()

# ساخت جدول برای ذخیره اطلاعات
c.execute('''CREATE TABLE IF NOT EXISTS transactions
             (id INTEGER PRIMARY KEY AUTOINCREMENT, transaction_type TEXT, name TEXT, amount INTEGER, price INTEGER, time TIMESTAMP)''')

# تابع برای افزودن اطلاعات به جدول
def add_transaction(transaction_type, name, amount, price):
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    c.execute("INSERT INTO transactions (transaction_type, name, amount, price, time) VALUES (?, ?, ?, ?, ?)", (transaction_type, name, amount, price, current_time))
    conn.commit()

async def handle_new_message(event):
    message = event.message
    if message.text:  
        if '✅' in message.text and '🔵' in message.text and '🔴' in message.text:  
            match = re.search(r'تعداد: (\d+) قیمت: (\d[\d,]*)', message.text) 
            if match: 
                amount = match.group(1)  
                price = match.group(2).replace(',', '')  
                print("قیمت معامله:", price)
                # حذف سه رقم انتهایی از عدد معامله
                price = price[:-3]
                add_transaction("deal", "معامله", amount, price)  # اضافه کردن به جدول

        elif '🔵' in message.text and '🔴' not in message.text:  
            match = re.search(r'🔵\s*(\S+\s*\S*\s*\S*)\s*(\d+)\s*خ\s*(\d[\d,]*)', message.text) 
            if match:  
                name = match.group(1)
                amount = match.group(2)
                price = match.group(3).replace(',', '')
                if 'آگهی خودکار' in message.text:
                    price = price[:-3]  # حذف سه رقم آخر
                print("خریدار:", name, "تعداد:", amount, "قیمت:", price)
                add_transaction("buy", name, amount, price)  # اضافه کردن به جدول


        elif '🔴' in message.text and '🔵' not in message.text:
            match = re.search(r'🔴\s*(\S+\s*\S*\s*\S*)\s*(\d+)\s*ف\s*(\d[\d,]*)', message.text)
            if match:
                name = match.group(1)
                amount = match.group(2)
                price = match.group(3).replace(',', '')
                if 'آگهی خودکار' in message.text:
                    price = price[:-3]  # حذف سه رقم آخر
                print("فروشنده:", name, "تعداد:", amount, "قیمت:", price)
                add_transaction("sell", name, amount, price)  # اضافه کردن به جدول

        elif '🟡' in message.text:  # اضافه کردن پیام‌هایی که دایره زرد دارند به عنوان مظنه
            match = re.search(r'🟡\s*مظنه:\s*(\d[\d,]*)', message.text)  
            if match:  
                price = match.group(1).replace(',', '')  
                print("قیمت مظنه:", price)
                add_transaction("suspect", "مظنه", 1, price)  # اضافه کردن به جدول
        



client = TelegramClient('session_name', api_id, api_hash)

client.add_event_handler(handle_new_message, NewMessage(chats=group_id))

with client:
    client.run_until_disconnected()

# بستن اتصال به پایگاه داده
conn.close()
