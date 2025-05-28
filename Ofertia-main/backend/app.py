from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/api/productos')
def get_productos():
    productos = [
        # Aquí pones los productos que tienes en tu JS, pero en Python (puedes usar una base de datos)
    ]
    return jsonify(productos)