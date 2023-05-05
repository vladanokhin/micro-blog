from fastapi import FastAPI

from src.config import settings


app = FastAPI(
    title=settings.PROJECT_NAME
)


@app.get('/')
async def index():
    return {'message': 'Hello world!'}
