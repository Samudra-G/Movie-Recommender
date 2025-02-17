from fastapi import FastAPI
from backend.database.database import engine, Base
from backend.models.models import User, Movie, Review, Poster, Recommendation

Base.metadata.create_all(bind=engine)
app = FastAPI()

@app.get("/")
async def read_root():
    return {"message" : "Movie Recommendation App is running!" }