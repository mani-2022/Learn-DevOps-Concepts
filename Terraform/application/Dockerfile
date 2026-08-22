FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pin install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 80

CMD ["python", "app.py"]
