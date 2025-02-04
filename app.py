from fastapi import FastAPI 
from transformers import pipeline 


# Create a new FastAPI  app instance 
app = FastAPI()

# Intialize the text generator pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"message": "Welcome to the FastAPI application!"}


#Define a function to handle the GET request at '/generate'

@app.get("/generate")
def generate(text : str):
    # Generate a text using the pipeline from the given text
    output  =  pipe(text)

    # return the output in the jason format 
    return{'output': output[0]['generated_text']}