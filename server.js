const express = require('express');
const app = express();
const PORT = 3000;

// Mock de productos
const products = {
  "audifonos-bluetooth-premium": {
    name: "Audífonos Bluetooth Premium",
    description: "Audífonos Bluetooth de alta calidad con cancelación de ruido.",
    rating: 4.5,
    reviewCount: 2453,
    currentMinPrice: 89900,
    averagePrice: 95000,
    maxHistoricalPrice: 120000,
    priceHistory: [89900, 95000, 120000, 110000],
    mainImage: "https://i.pinimg.com/736x/68/9c/9b/689c9b23e5254514197b9b209310e34d.jpg",
    images: [
      {
        full: "https://i.pinimg.com/736x/68/9c/9b/689c9b23e5254514197b9b209310e34d.jpg",
        thumbnail: "https://i.pinimg.com/736x/68/9c/9b/689c9b23e5254514197b9b209310e34d.jpg",
        description: "Vista frontal"
      },
      {
        full: "https://ejemplo.com/audifonos-lateral.jpg",
        thumbnail: "https://ejemplo.com/audifonos-lateral.jpg",
        description: "Vista lateral"
      }
    ],
    categoryPath: [
      { name: "Tecnología", url: "/categoria-tecnologia.html" }
    ]
  }
};

// Endpoint para obtener datos de producto
app.get('/api/products/:id', (req, res) => {
  const product = products[req.params.id];
  if (product) {
    res.json(product);
  } else {
    res.status(404).json({ error: "Producto no encontrado" });
  }
});

// Endpoint para resumen de precios
app.get('/api/products/:id/prices', (req, res) => {
  const product = products[req.params.id];
  if (product) {
    res.json({
      lowestPrice: product.currentMinPrice,
      highestPrice: product.maxHistoricalPrice,
      storeCount: 3 // Simulación
    });
  } else {
    res.status(404).json({ error: "Producto no encontrado" });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});