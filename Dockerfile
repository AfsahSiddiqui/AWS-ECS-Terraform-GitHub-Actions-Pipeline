FROM python:3.12.3-slim
WORKDIR /app
COPY app/ /app/
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y curl
CMD ["python", "main.py"]

