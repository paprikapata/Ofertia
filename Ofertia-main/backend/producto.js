// ... existing code ...
// Suponiendo que tienes un contenedor en tu HTML con id="lista-productos"
async function mostrarProductos() {
  const contenedor = document.getElementById('lista-productos');
  if (!contenedor) return;
  contenedor.innerHTML = '';
  const response = await fetch('/api/productos');
  const productos = await response.json();
  productos.forEach(producto => {
    const div = document.createElement('div');
    div.className = 'card-producto';
    div.innerHTML = `
      <div class="producto-imagen">
        <img src="${producto.imagenes[0]}" alt="${producto.titulo}" class="imagen-responsive">
      </div>
      <div class="producto-info">
        <p class="producto-categoria">${producto.categoria}</p>
        <h3 class="producto-titulo">${producto.titulo}</h3>
        <p class="producto-precio">Desde <strong>$${producto.precio.toLocaleString()}</strong></p>
      </div>
    `;
    contenedor.appendChild(div);
  });
}

// Llama a la función cuando cargue la página
window.addEventListener('DOMContentLoaded', mostrarProductos);
// ... existing code ...