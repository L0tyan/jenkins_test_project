FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask && \
    echo "from flask import Flask\n\napp = Flask(__name__)\n\n@app.route('/')\ndef hello():\n    return 'Hello from Docker!'\n\nif __name__ == '__main__':\n    app.run(host='0.0.0.0', port=5000)" > app.py
EXPOSE 5000
CMD ["python", "app.py"]
