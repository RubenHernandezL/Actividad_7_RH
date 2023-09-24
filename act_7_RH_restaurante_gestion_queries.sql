USE restaurante_gestion;

## Iniciamos rellenando los campos de las tablas para hacer las pruebas de las Querys 
## (FYI al final se encuentran desarrolladas las 2 Query solicitadas en la actividad)

/* Insertamos 15 clientes de muestra con nombres al azar y números de teléfono sin separadores */
INSERT INTO restaurante_gestion.cliente (nombre, telefono, email, m_ocupada) VALUES
('Juan', '123456789', 'cliente1@example.com', 0),
('María', '987654321', 'cliente2@example.com', 1),
('Carlos', '456789123', 'cliente3@example.com', 0),
('Ana', '789123456', 'cliente4@example.com', 1),
('Luis', '234567890', 'cliente5@example.com', 0),
('Laura', '654321987', 'cliente6@example.com', 0),
('Pedro', '345678912', 'cliente7@example.com', 1),
('Isabel', '567890123', 'cliente8@example.com', 0),
('Manuel', '678912345', 'cliente9@example.com', 1),
('Marta', '876543210', 'cliente10@example.com', 0),
('Rosa', '112233445', 'cliente11@example.com', 1),
('Javier', '334455667', 'cliente12@example.com', 0),
('Carmen', '556677889', 'cliente13@example.com', 0),
('Pablo', '778899001', 'cliente14@example.com', 1),
('Patricia', '990011223', 'cliente15@example.com', 1);

/* Insertamos 7 locales de muestra con nombres de restaurantes aleatorios */
INSERT INTO restaurante_gestion.locales (nombre, direccion, telefono, nombre_del_responsable, abierto) VALUES
('El Rincón del Sabor', 'Calle Principal, Ciudad A', '123456789', 'Juan Pérez', 1),
('La Trattoria Italiana', 'Avenida Central, Ciudad B', '987654321', 'María González', 0),
('Asador Don Carlos', 'Paseo del Sol, Ciudad C', '456789123', 'Carlos Rodríguez', 1),
('Sushi Fusion', 'Calle Sakura, Ciudad D', '789123456', 'Ana López', 0),
('La Parrillada Argentina', 'Avenida del Fuego, Ciudad E', '234567890', 'Luis Martínez', 1),
('El Bistró de la Luna', 'Calle Luna, Ciudad F', '654321987', 'Laura Sánchez', 0),
('Taste of India', 'Avenida Especias, Ciudad G', '345678912', 'Pedro Fernández', 1);

/* Insertamos 28 registros de mesas de muestra distribuidos en los 7 locales con formato para fecha_ocupacion */
INSERT INTO restaurante_gestion.mesas (numero_mesa, numero_comensales, ocupada, fecha_ocupacion, locales_id, cliente_id) VALUES
-- Mesas del Local 1
(1, 4, 1, '2023-09-10 23:00:00', 1, 1),
(2, 2, 0, NULL, 1, NULL),
(3, 6, 0, NULL, 1, NULL),
(4, 8, 1, '2023-09-12 23:00:00', 1, 2),

-- Mesas del Local 2
(1, 2, 1, '2023-09-17 23:00:00', 2, 4),
(2, 4, 0, NULL, 2, NULL),
(3, 6, 1, '2023-09-15 23:00:00', 2, 5),
(4, 8, 0, NULL, 2, NULL),

-- Mesas del Local 3
(1, 4, 1, '2023-09-20 23:00:00', 3, 7),
(2, 2, 0, NULL, 3, NULL),
(3, 6, 0, NULL, 3, NULL),
(4, 8, 1, '2023-09-19 23:00:00', 3, 8),

-- Mesas del Local 4
(1, 2, 0, NULL, 4, NULL),
(2, 4, 1, '2023-09-01 23:00:00', 4, 9),
(3, 6, 0, NULL, 4, NULL),
(4, 8, 1, '2023-09-03 23:00:00', 4, 10),

-- Mesas del Local 5
(1, 4, 1, '2023-09-04 23:00:00', 5, 12),
(2, 2, 0, NULL, 5, NULL),
(3, 6, 0, NULL, 5, NULL),
(4, 8, 1, '2023-09-18 23:00:00', 5, 13),

-- Mesas del Local 6
(1, 4, 1, '2023-09-22 23:00:00', 6, 15),
(2, 2, 0, NULL, 6, NULL),
(3, 6, 0, NULL, 6, NULL),
(4, 8, 1, '2023-09-21 23:00:00', 6, 1),

-- Mesas del Local 7
(1, 4, 1, '2023-09-21 23:00:00', 7, 12),
(2, 2, 0, NULL, 7, NULL),
(3, 6, 0, NULL, 7, NULL),
(4, 8, 1, '2023-09-5 23:00:00', 7, 2);

/* Insertamos registros de clientes favoritos de locales */
INSERT INTO restaurante_gestion.favoritos (cliente_id, locales_id) VALUES
-- Cliente 1 tiene un local favorito
(1, 1),
-- Cliente 2 tiene un local favorito
(2, 2),
-- Cliente 3 tiene un local favorito
(3, 3),
-- Cliente 4 tiene un local favorito
(4, 4),
-- Cliente 5 tiene un local favorito
(5, 5),
-- Cliente 6 tiene un local favorito
(6, 6),
-- Cliente 7 tiene un local favorito
(7, 7),
-- Cliente 8 tiene un local favorito
(8, 1),
-- Cliente 9 tiene un local favorito
(9, 2),
-- Cliente 10 tiene un local favorito
(10, 3),
-- Cliente 1 tiene otro local favorito
(1, 5),
-- Cliente 1 tiene otro local favorito
(1, 3);

## Una vez se han rellenado las tablas, se procede a realizar las QUERIES que se piden para la práctica

#QUERY 1
#Todas las mesas ocupadas de un local en concreto, así como los clientes que las ocupan:
SELECT m.numero_mesa AS 'Nº MESA', c.nombre AS 'Nombre del Cliente' 
FROM restaurante_gestion.mesas AS m, restaurante_gestion.cliente AS c 
WHERE m.cliente_id = c.id AND m.ocupada = 1 AND m.locales_id = 2;


#QUERY 2
#Todos los locales marcados como favorito por un cliente, incluyendo la información del local y del cliente:
SELECT l.nombre as 'Restaurante', l.direccion as "Dirección", l.telefono AS 'Contacto',  l.nombre_del_responsable AS 'Responsable', 
	c.nombre as 'Cliente', c.telefono AS 'Teléfono del Cliente', c.email AS 'Email del Cliente'
FROM restaurante_gestion.favoritos AS f 
	INNER JOIN restaurante_gestion.locales AS l ON f.locales_id = l.id
    INNER JOIN restaurante_gestion.cliente AS c ON f.cliente_id = c.id
WHERE c.nombre = "Juan";
