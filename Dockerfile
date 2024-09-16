# Dockerfile for book_catalog microservice
#use pytnon 3.9 image as the base
FROM python:3.9-slim

#set the working directory
WORKDIR /app

#copy the requirements file
COPY book_catalog/requirements.txt .

#install the requirements
RUN pip install --no-cache-dir -r requirements.txt

#copy the rest of the application code
COPY . .

#sets the python path
ENV PYTHONPATH=/app/book_catalog

#Defines the command to run the FastAPI application using Uvicorn
CMD [ "uvicorn","book_catalog.main:app","--host","0.0.0.0","--port","8000" ]
