from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/api")
def api():
    return jsonify({"mensagem": "Minha primeira API com Flask!"})

@app.route("/")
def home():
    return "Olá, Docker no Pop!_OS 🚀"

@app.route("/testes")
def testes():
    return "testando rotas"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)