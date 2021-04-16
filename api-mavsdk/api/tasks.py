from celery import Celery
from .follow_me import fly_drone
import asyncio

app = Celery('tasks', backend='django-db', broker='amqp://myuser:mypassword@localhost:5672/myvhost')

@app.task
def fly_test():
    loop = asyncio.new_event_loop()
    loop.run_until_complete(fly_drone())
    loop.close()