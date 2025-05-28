document.addEventListener('DOMContentLoaded', function() {
    // Menu Navigation
    const menuItems = document.querySelectorAll('.admin-menu li');
    const sections = document.querySelectorAll('.admin-content section');

    menuItems.forEach(item => {
        item.addEventListener('click', () => {
            // Remove active class from all items
            menuItems.forEach(i => i.classList.remove('active'));
            sections.forEach(s => s.classList.remove('active'));

            // Add active class to clicked item
            item.classList.add('active');
            const sectionId = item.getAttribute('data-section');
            document.getElementById(sectionId).classList.add('active');
        });
    });

    // Load Dashboard Data
    loadDashboardStats();

    // Load Initial Data
    loadUsers();
    loadComments();
    loadProducts();
    loadProductOptions();
    loadStores();
});

// Dashboard Statistics
async function loadDashboardStats() {
    try {
        const stats = await fetchStats();
        updateStatCards(stats);
    } catch (error) {
        console.error('Error loading dashboard stats:', error);
    }
}

// Users Management
async function loadUsers() {
    try {
        const response = await fetch('../backend/CONTROLADOR/Consultar_usuarios.php');
        const users = await response.json();
        displayUsers(users);
    } catch (error) {
        console.error('Error loading users:', error);
    }
}

function displayUsers(users) {
    const tbody = document.getElementById('users-table-body');
    tbody.innerHTML = '';

    users.forEach(user => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.role}</td>
            <td>${user.status}</td>
            <td>
                <button onclick="editUser(${user.id})">Editar</button>
                <button onclick="deleteUser(${user.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// Comments Management
async function loadComments() {
    try {
        const response = await fetch('../backend/CONTROLADOR/buscar_comentario.php');
        const comments = await response.json();
        displayComments(comments);
    } catch (error) {
        console.error('Error loading comments:', error);
    }
}

function displayComments(comments) {
    const tbody = document.getElementById('comments-table-body');
    tbody.innerHTML = '';

    comments.forEach(comment => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${comment.id}</td>
            <td>${comment.user}</td>
            <td>${comment.product}</td>
            <td>${comment.content}</td>
            <td>${comment.date}</td>
            <td>
                <button onclick="approveComment(${comment.id})">Aprobar</button>
                <button onclick="deleteComment(${comment.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// Helper Functions
async function fetchStats() {
    // Implement API calls to get statistics
    return {
        users: await getUserCount(),
        products: await getProductCount(),
        comments: await getCommentCount(),
        stores: await getStoreCount()
    };
}

function updateStatCards(stats) {
    document.querySelector('#dashboard .stat-card:nth-child(1) .stat-number').textContent = stats.users;
    document.querySelector('#dashboard .stat-card:nth-child(2) .stat-number').textContent = stats.products;
    document.querySelector('#dashboard .stat-card:nth-child(3) .stat-number').textContent = stats.comments;
    document.querySelector('#dashboard .stat-card:nth-child(4) .stat-number').textContent = stats.stores;
}

// User Actions
function editUser(userId) {
    // Implement user editing functionality
    console.log('Editing user:', userId);
}

function deleteUser(userId) {
    // Implement user deletion functionality
    console.log('Deleting user:', userId);
}

// Comment Actions
function approveComment(commentId) {
    // Implement comment approval functionality
    console.log('Approving comment:', commentId);
}

function deleteComment(commentId) {
    // Implement comment deletion functionality
    console.log('Deleting comment:', commentId);
}

// Products Management
async function loadProducts() {
    try {
        const response = await fetch('../backend/CONTROLADOR/Consultar_producto.php');
        const products = await response.json();
        displayProducts(products);
    } catch (error) {
        console.error('Error loading products:', error);
    }
}

function displayProducts(products) {
    const tbody = document.getElementById('products-table-body');
    tbody.innerHTML = '';

    products.forEach(product => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.description}</td>
            <td>${product.price}</td>
            <td>${product.category}</td>
            <td>
                <button onclick="editProduct(${product.id})">Editar</button>
                <button onclick="deleteProduct(${product.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// Product Options Management
async function loadProductOptions() {
    try {
        const response = await fetch('../backend/CONTROLADOR/Buscar_opciones_p.php');
        const options = await response.json();
        displayProductOptions(options);
    } catch (error) {
        console.error('Error loading product options:', error);
    }
}

function displayProductOptions(options) {
    const tbody = document.getElementById('product-options-table-body');
    tbody.innerHTML = '';

    options.forEach(option => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${option.id}</td>
            <td>${option.product_id}</td>
            <td>${option.name}</td>
            <td>${option.value}</td>
            <td>
                <button onclick="editProductOption(${option.id})">Editar</button>
                <button onclick="deleteProductOption(${option.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// Stores Management
async function loadStores() {
    try {
        const response = await fetch('../backend/CONTROLADOR/Buscar_tienda.php');
        const stores = await response.json();
        displayStores(stores);
    } catch (error) {
        console.error('Error loading stores:', error);
    }
}

function displayStores(stores) {
    const tbody = document.getElementById('stores-table-body');
    tbody.innerHTML = '';

    stores.forEach(store => {
        const tr = document.createElement('tr');
        tr.innerHTML = `
            <td>${store.id}</td>
            <td>${store.name}</td>
            <td>${store.location}</td>
            <td>${store.contact}</td>
            <td>
                <button onclick="editStore(${store.id})">Editar</button>
                <button onclick="deleteStore(${store.id})">Eliminar</button>
            </td>
        `;
        tbody.appendChild(tr);
    });
}

// Product Actions
function editProduct(productId) {
    window.location.href = `../backend/CONTROLADOR/actualizar_producto.php?id=${productId}`;
}

function deleteProduct(productId) {
    if (confirm('¿Estás seguro de que deseas eliminar este producto?')) {
        window.location.href = `../backend/CONTROLADOR/eliminar_producto.php?id=${productId}`;
    }
}

// Product Option Actions
function editProductOption(optionId) {
    window.location.href = `../backend/CONTROLADOR/actualizar_opcion_p.php?id=${optionId}`;
}

function deleteProductOption(optionId) {
    if (confirm('¿Estás seguro de que deseas eliminar esta opción de producto?')) {
        window.location.href = `../backend/CONTROLADOR/eliminar_o_p.php?id=${optionId}`;
    }
}

// Store Actions
function editStore(storeId) {
    window.location.href = `../backend/CONTROLADOR/actualizar_tiendas.php?id=${storeId}`;
}

function deleteStore(storeId) {
    if (confirm('¿Estás seguro de que deseas eliminar esta tienda?')) {
        window.location.href = `../backend/CONTROLADOR/eliminar_tienda.php?id=${storeId}`;
    }
}

// Helper Functions for Stats
async function getUserCount() {
    try {
        const response = await fetch('../backend/CONTROLADOR/admin.php?action=count_users');
        const data = await response.json();
        return data.count;
    } catch (error) {
        console.error('Error getting user count:', error);
        return 0;
    }
}

async function getProductCount() {
    try {
        const response = await fetch('../backend/CONTROLADOR/admin.php?action=count_products');
        const data = await response.json();
        return data.count;
    } catch (error) {
        console.error('Error getting product count:', error);
        return 0;
    }
}

async function getCommentCount() {
    try {
        const response = await fetch('../backend/CONTROLADOR/admin.php?action=count_comments');
        const data = await response.json();
        return data.count;
    } catch (error) {
        console.error('Error getting comment count:', error);
        return 0;
    }
}

async function getStoreCount() {
    try {
        const response = await fetch('../backend/CONTROLADOR/admin.php?action=count_stores');
        const data = await response.json();
        return data.count;
    } catch (error) {
        console.error('Error getting store count:', error);
        return 0;
    }
}

// Helper Functions
async function fetchStats() {
    // Implement API calls to get statistics
    return {
        users: await getUserCount(),
        products: await getProductCount(),
        comments: await getCommentCount(),
        stores: await getStoreCount()
    };
}

function updateStatCards(stats) {
    document.querySelector('#dashboard .stat-card:nth-child(1) .stat-number').textContent = stats.users;
    document.querySelector('#dashboard .stat-card:nth-child(2) .stat-number').textContent = stats.products;
    document.querySelector('#dashboard .stat-card:nth-child(3) .stat-number').textContent = stats.comments;
    document.querySelector('#dashboard .stat-card:nth-child(4) .stat-number').textContent = stats.stores;
}

// User Actions
function editUser(userId) {
    // Implement user editing functionality
    console.log('Editing user:', userId);
}

function deleteUser(userId) {
    // Implement user deletion functionality
    console.log('Deleting user:', userId);
}

// Comment Actions
function approveComment(commentId) {
    // Implement comment approval functionality
    console.log('Approving comment:', commentId);
}

function deleteComment(commentId) {
    // Implement comment deletion functionality
    console.log('Deleting comment:', commentId);
}
