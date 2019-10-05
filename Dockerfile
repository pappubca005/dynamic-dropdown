FROM python:3.6-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /app
WORKDIR /app
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install psycopg2-binary
COPY requirements.txt /app/
RUN pip install psycopg2
RUN pip install -r requirements.txt
COPY . /app/