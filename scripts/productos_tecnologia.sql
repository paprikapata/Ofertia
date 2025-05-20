-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS maqueta CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE maqueta;

-- Crear la tabla de productos
CREATE TABLE IF NOT EXISTS producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio INT NOT NULL,
    imagen VARCHAR(255) NOT NULL
);

-- Insertar productos de tecnología
INSERT INTO producto (titulo, categoria, precio, imagen) VALUES
('Samsung Galaxy S23 128GB', 'Tecnología', 3200000, 'https://www.alkosto.com/medias/8806094710625-001-750Wx750H?context=bWFzdGVyfGltYWdlc3wxMzY1MnxpbWFnZS93ZWJwfGFEQTRMMmhqWkM4eE5Ea3lOVFE0TWpjMU5EQTNPQzg0T0RBMk1EazBOekV3TmpJMVh6QXdNVjgzTlRCWGVEYzFNRWd8YjhjYWJkYWYyMzdlYWY3ZDE3NmQwZDExNWNkMmY3ZDUyMWZiMjkxN2MxM2ZjMWZiYTcwZTBlY2FhMzI1ZDE0OQ'),
('Apple AirPods Pro 2da Gen', 'Tecnología', 1100000, 'https://http2.mlstatic.com/D_NQ_NP_779146-MLA53778959612_022023-O.webp'),
('Portátil Lenovo 15.6\" Ryzen 5 8GB 512GB SSD', 'Tecnología', 2200000, 'https://http2.mlstatic.com/D_NQ_NP_897490-MLU77338586016_072024-O.webp'),
('Xiaomi Redmi Note 12 128GB', 'Tecnología', 850000, 'https://http2.mlstatic.com/D_NQ_NP_993572-MLA73980600102_012024-O.webp'),
('Audífonos Bluetooth JBL Tune 510BT', 'Tecnología', 120000, 'https://http2.mlstatic.com/D_NQ_NP_821721-MLU77335571890_072024-O.webp'),
('Smartwatch Amazfit Bip U', 'Tecnología', 220000, 'https://http2.mlstatic.com/D_NQ_NP_606167-MCO79431213854_092024-O.webp'),
('Tablet Samsung Galaxy Tab A8 64GB', 'Tecnología', 750000, 'https://http2.mlstatic.com/D_NQ_NP_687759-MLU78817843472_092024-O.webp'),
('Monitor LG 24\'\' Full HD IPS', 'Tecnología', 520000, 'https://http2.mlstatic.com/D_NQ_NP_612980-MLA76911848964_062024-O.webp'),
('Disco Duro Externo Seagate 1TB', 'Tecnología', 210000, 'https://http2.mlstatic.com/D_NQ_NP_907894-MCO31558532242_072019-O.webp'),
('Teclado Mecánico Redragon Kumara', 'Tecnología', 150000, 'https://http2.mlstatic.com/D_NQ_NP_864807-MLA77594879101_072024-O.webp'),
('Mouse Inalámbrico Logitech M185', 'Tecnología', 45000, 'https://http2.mlstatic.com/D_NQ_NP_848052-MLU72570326002_112023-O.webp'),
('Cámara Web Logitech C920 HD', 'Tecnología', 230000, 'https://http2.mlstatic.com/D_NQ_NP_760342-MLA49170463523_022022-O.webp'),
('Impresora HP Ink Tank 315', 'Tecnología', 520000, 'https://media.falabella.com/falabellaCO/5221613_1/w=800,h=800,fit=pad'),
('Smart TV LG 50\'\' 4K UHD', 'Tecnología', 1499000, 'https://exitocol.vtexassets.com/arquivos/ids/27169249/Televisor-LG-50-Pulgadas-LED-Uhd-4K-Smart-TV-50UR7800PSBAWC-3382700_a.jpg?v=638792026341870000'),
('Google Chromecast 4K con Google TV', 'Tecnología', 250000, 'https://www.alkosto.com/medias/193575007250-001-750Wx750H?context=bWFzdGVyfGltYWdlc3w0NDQ0fGltYWdlL3dlYnB8YUdVd0wyaGxNUzh4TkRNMk5EZ3hNekkyTWpnM09DOHhPVE0xTnpVd01EY3lOVEJmTURBeFh6YzFNRmQ0TnpVd1NBfDdlMTVjODcwMTJiYmZhODZjYjQ1NjJkOGY0NGRhMzAxMDI1NjY0ODNkM2IyYTZhMDRlNDIxMGQwNDcxM2MxMjQ');