from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
import os

app = Flask(__name__)
# Cambia la URI de la base de datos a MySQL
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://usuario:contraseña@localhost/maqueta'
db = SQLAlchemy(app)

class Producto(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    titulo = db.Column(db.String(100), nullable=False)
    categoria = db.Column(db.String(50), nullable=False)
    precio = db.Column(db.Integer, nullable=False)
    imagen = db.Column(db.String(200), nullable=False)

    def to_dict(self):
        return {
            "id": self.id,
            "titulo": self.titulo,
            "categoria": self.categoria,
            "precio": self.precio,
            "imagenes": [self.imagen]
        }

# El resto del código permanece igual, pero ya no necesitas inicializar la base de datos aquí,
# porque ya la tienes creada en MySQL con tu script SQL.

@app.route('/api/productos')
def obtener_productos():
    productos = Producto.query.all()
    return jsonify([p.to_dict() for p in productos])

if __name__ == '__main__':
    app.run(debug=True)