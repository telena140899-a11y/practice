-- ==========================================
-- База данных "Туризм"
-- Автор: Елена Филипцева
-- ==========================================

DROP DATABASE IF EXISTS Tourism;
CREATE DATABASE Tourism;
USE Tourism;

-- ==========================
-- Таблица туров
-- ==========================

CREATE TABLE Tours (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    country VARCHAR(50) NOT NULL,
    tour_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    duration INT NOT NULL
);

-- ==========================
-- Таблица клиентов
-- ==========================

CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL
);

-- ==========================
-- Таблица услуг
-- ==========================

CREATE TABLE Services (
    service_id INT PRIMARY KEY AUTO_INCREMENT,
    service_name VARCHAR(100) NOT NULL
);

-- ==========================
-- Таблица менеджеров
-- ==========================

CREATE TABLE Managers (
    manager_id INT PRIMARY KEY AUTO_INCREMENT,
    manager_name VARCHAR(100) NOT NULL
);

-- ==========================
-- Таблица заказов
-- ==========================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT NOT NULL,
    tour_id INT NOT NULL,
    service_id INT NOT NULL,
    manager_id INT NOT NULL,
    order_date DATE NOT NULL,

    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (tour_id) REFERENCES Tours(tour_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (manager_id) REFERENCES Managers(manager_id)
);

-- ==========================
-- Заполнение таблицы Tours
-- ==========================

INSERT INTO Tours (country, tour_name, price, duration)
VALUES
('Россия', 'Золотое кольцо', 32000.00, 5),
('Россия', 'Байкал (Иркутск)', 68000.00, 8),
('Россия', 'Карелия (Петрозаводск)', 45000.00, 6);

-- ==========================
-- Заполнение таблицы Clients
-- ==========================

INSERT INTO Clients (full_name, phone)
VALUES
('Иванов Иван', '+71111111111'),
('Дмитриев Дмитрий', '+72222222222'),
('Петров Петр', '+73333333333');

-- ==========================
-- Заполнение таблицы Services
-- ==========================

INSERT INTO Services (service_name)
VALUES
('Трансфер'),
('Медицинское страхование'),
('Экскурсионное сопровождение');

-- ==========================
-- Заполнение таблицы Managers
-- ==========================

INSERT INTO Managers (manager_name)
VALUES
('Смирнова Елена'),
('Кузнецов Андрей');

-- ==========================
-- Заполнение таблицы Orders
-- ==========================

INSERT INTO Orders
(client_id, tour_id, service_id, manager_id, order_date)
VALUES
(1,1,2,1,'2026-07-17'),
(2,2,3,2,'2026-07-18'),
(3,3,1,1,'2026-07-19');

-- ==========================
-- Итоговый запрос
-- ==========================

SELECT
    c.full_name AS 'Клиент',
    t.tour_name AS 'Тур',
    s.service_name AS 'Услуга',
    m.manager_name AS 'Менеджер',
    o.order_date AS 'Дата заказа',
    t.price AS 'Стоимость'
FROM Orders o
JOIN Clients c ON o.client_id = c.client_id
JOIN Tours t ON o.tour_id = t.tour_id
JOIN Services s ON o.service_id = s.service_id
JOIN Managers m ON o.manager_id = m.manager_id;