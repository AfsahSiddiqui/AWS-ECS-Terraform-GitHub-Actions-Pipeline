from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello, this is a simple web page"

@app.route("/poem")
def poem():
    return "twinkle twinkle little star<br>how i wonder what you are<br>up above the world so high<br>like a diamond in the sky<br>twinkle twinkle little star"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
