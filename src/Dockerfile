FROM python:3.6-slim

WORKDIR /app

COPY requirements.txt /app
RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5000
CMD ["python", "app.py", "runserver", "0.0.0.0:5000"]
