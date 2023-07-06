-- Active: 1685437711224@@127.0.0.1@3306@projet_parfum

DROP TABLE IF EXISTS options_orderItem;

DROP TABLE IF EXISTS orderItem;

DROP TABLE IF EXISTS options;

DROP TABLE IF EXISTS product;

DROP TABLE IF EXISTS orders;

DROP TABLE IF EXISTS shop;

CREATE TABLE
    orders (
        id INT PRIMARY KEY AUTO_INCREMENT,
        createdAt DATE NOT NULL,
        customerName VARCHAR(255) NOT NULL
    );

CREATE TABLE
    shop (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(255) NOT NULL,
        address VARCHAR(255) NOT NULL
    );

CREATE TABLE
    product (
        id INT PRIMARY KEY AUTO_INCREMENT,
        label VARCHAR(255) NOT NULL,
        basePrice FLOAT NOT NULL,
        description varchar(255),
        picture varchar(255),
        id_shop INT,
        Foreign Key (id_shop) REFERENCES shop(id) ON DELETE CASCADE
    );

CREATE TABLE
    options (
        id INT PRIMARY KEY AUTO_INCREMENT,
        label VARCHAR(255) NOT NULL,
        price float NOT NULL,
        id_product INT,
        Foreign Key (id_product) REFERENCES product(id) ON DELETE CASCADE
    );

CREATE TABLE
    orderitem (
        id INT PRIMARY KEY AUTO_INCREMENT,
        quantity INT NOT NULL,
        itemPrice float NOT NULL,
        id_orders INT,
        id_product INT,
        Foreign Key (id_orders) REFERENCES orders(id) ON DELETE CASCADE,
        Foreign Key (id_product) REFERENCES product(id) ON DELETE CASCADE
    );

CREATE TABLE
    options_orderitem (
        id_options INT,
        id_orderitem INT,
        PRIMARY key (id_options, id_orderitem),
        Foreign Key (id_options) REFERENCES options(id) ON DELETE CASCADE,
        Foreign Key (id_orderitem) REFERENCES orderitem(id) ON DELETE CASCADE
    );

INSERT INTO
    `shop` (`id`, `name`, `address`)
VALUES (
        1,
        'NNCM',
        '27 rue de la parfumerie perpette-les-bains'
    );

INSERT INTO
    `product` (
        `id`,
        `label`,
        `basePrice`,
        `description`,
        `picture`,
        `id_shop`
    )
VALUES (
        1,
        'Libre',
        130.99,
        'LIBRE s\'ouvre de notes douces de vanille avec des pics frais de lavande. Ensuite s\'explose par de fleurs blanches.',
        'https://www.yslbeauty.fr/dw/image/v2/AAQP_PRD/on/demandware.static/-/Sites-ysl-master-catalog/default/dw1c419af7/square/Fragrance/For-Her/WW-50424YSL_Libre_Eau_de_Parfum/3614272648418_libre_eau_de_parfum_50ml_alt1.jpg?sw=375&sh=375&sm=cut&sfrm=jpg&q=85',
        1
    ), (
        2,
        'Lady million',
        80.5,
        'parfum pour femme boisé et floral, alliant des fleurs fraîches, mais charnelles, à un patchouli sensuel. Un parfum frais et addictif, séduisant et désarmant !',
        'https://i1.perfumesclub.com/grandewp/29210.webp',
        1
    ), (
        3,
        'J\'adore',
        99.52,
        'Les notes de tête sont Poire, Melon, Magnolia, Pêche, Mandarine et Bergamote; les notes de coeur sont Jasmin, Muguet, Tubéreuse, Freesia, Rose, Orchidée, Prune et Violette; les notes de fond sont Musc, Vanille, Mûre et Cèdre.',
        'https://www.sephora.fr/dw/image/v2/BCVW_PRD/on/demandware.static/-/Sites-masterCatalog_Sephora/default/dw4d39833b/images/hi-res/SKU/SKU_6/71393_swatch.jpg?sw=585&sh=585&sm=fit',
        1
    );

INSERT INTO
    `options` (
        `id`,
        `label`,
        `price`,
        `id_product`
    )
VALUES (
        1,
        'Grave un nom sur le packaging',
        30.23,
        1
    ), (
        2,
        'Grave un nom sur le packaging',
        30.23,
        2
    ), (
        3,
        'Graver un nom sur le packaging',
        30.23,
        3
    ), (4, 'Changer le flacon', 15.2, 1), (5, 'Changer le flacon', 15.2, 2), (6, 'Changer le flacon', 15.2, 3);

INSERT INTO
    `orders` (
        `id`,
        `createdAt`,
        `customerName`
    )
VALUES (
        1,
        '2023-07-06 11:10:32',
        'Jean le bon'
    );

INSERT INTO
    `orderitem` (
        `id`,
        `quantity`,
        `itemPrice`,
        `id_product`,
        `id_orders`
    )
VALUES (1, 5, 725.36, 2, 1);

SELECT *
FROM product
    LEFT JOIN shop ON product.id_shop = shop.id
WHERE product.id_shop = 1;

SELECT *
FROM orders
    LEFT JOIN orderitem ON orderitem.id_orders = orders.id
WHERE
    orderitem.id_orders = 1;

INSERT INTO
    `options_orderitem` (
        `id_options`,
        `id_orderitem`
    )
VALUES (1,1),(2,1),(3,1),(4,1);

SELECT *
FROM orderitem
    LEFT JOIN product ON product.id = orderitem.id_product
    LEFT JOIN options_orderitem ON options_orderitem.id_orderitem = orderitem.id
    LEFT JOIN options ON options.id = options_orderitem.id_options
WHERE orderitem.id_orders = 1;