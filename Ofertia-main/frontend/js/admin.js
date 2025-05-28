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