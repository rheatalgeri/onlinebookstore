use onlinebs;

CREATE TABLE users (
    userId VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    contactNo VARCHAR(255),
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE book (
    bookId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    description TEXT,
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    orderId BIGINT NOT NULL PRIMARY KEY,
    userId VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    createDateTime TIMESTAMP,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

CREATE TABLE orderbook (
    orderBookId INT NOT NULL AUTO_INCREMENT,
    orderId BIGINT NOT NULL,
    bookId INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (orderBookId),
    FOREIGN KEY (orderId) REFERENCES orders(orderId),
    FOREIGN KEY (bookId) REFERENCES book(bookId)
);

CREATE TABLE cartitem (
    userId VARCHAR(255) NOT NULL,
    bookId INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (userId, bookId), 
    FOREIGN KEY (userId) REFERENCES users(userId),
    FOREIGN KEY (bookId) REFERENCES book(bookId)
);


INSERT INTO book (name, description, price) VALUES
('Harry Potter and the Sorcerer''s Stone', 'The first book in J.K. Rowling''s fantasy series about a young wizard.', 15.99),
('Harry Potter and the Chamber of Secrets', 'The second book in J.K. Rowling''s Harry Potter series.', 14.99),
('Harry Potter and the Prisoner of Azkaban', 'The third book in J.K. Rowling''s Harry Potter series.', 16.50),
('Harry Potter and the Goblet of Fire', 'The fourth book in J.K. Rowling''s Harry Potter series.', 17.25),
('Harry Potter and the Order of the Phoenix', 'The fifth book in J.K. Rowling''s Harry Potter series.', 18.75),
('Harry Potter and the Half-Blood Prince', 'The sixth book in J.K. Rowling''s Harry Potter series.', 19.99),
('Harry Potter and the Deathly Hallows', 'The seventh and final book in J.K. Rowling''s Harry Potter series.', 20.50);


INSERT INTO book (name, description, price) VALUES
('The Lord of the Rings', 'J.R.R. Tolkien\'s epic fantasy trilogy following the quest to destroy the One Ring.', 18.99),
('To Kill a Mockingbird', 'Harper Lee\'s Pulitzer Prize-winning novel addressing racial injustice in the South.', 10.50),
('The Catcher in the Rye', 'J.D. Salinger\'s coming-of-age novel narrated by Holden Caulfield.', 11.25),
('Pride and Prejudice', 'Jane Austen\'s classic romance novel set in early 19th-century England.', 8.99),
('The Great Gatsby', 'A novel by F. Scott Fitzgerald depicting the American Dream during the Jazz Age.', 12.99),
('1984', 'George Orwell\'s dystopian masterpiece exploring themes of totalitarianism and surveillance.', 9.75),
('The Hobbit', 'J.R.R. Tolkien\'s fantasy novel about the hobbit Bilbo Baggins\'s adventure to the Lonely Mountain.', 13.50),
('The Da Vinci Code', 'Dan Brown\'s thriller novel following symbologist Robert Langdon\'s quest to solve a murder.', 16.25),
('The Alchemist', 'Paulo Coelho\'s philosophical novel about a shepherd boy named Santiago\'s journey to find his treasure.', 10.99);

INSERT INTO users (userId, password, contactNo, email, name) VALUES
('john_doe', 'password123', '1234567890', 'john@example.com', 'John Doe'),
('alice_smith', 'securepass', '9876543210', 'alice@example.com', 'Alice Smith'),
('mike_jones', 'mikepass', '5551234567', 'mike@example.com', 'Mike Jones'),
('emily_wilson', 'emilypass', '9998765432', 'emily@example.com', 'Emily Wilson'),
('david_brown', 'brownpass', '7778889999', 'david@example.com', 'David Brown');


INSERT INTO orders (orderId, userId, amount, createDateTime) VALUES
(1, 'john_doe', 45.97, NOW()),
(2, 'alice_smith', 33.74, NOW()),
(3, 'mike_jones', 28.24, NOW()),
(4, 'emily_wilson', 26.49, NOW()),
(5, 'david_brown', 37.23, NOW());

INSERT INTO orderbook (orderId, bookId, quantity) VALUES
(1, 1, 2), 
(1, 4, 1), 
(2, 3, 3), 
(3, 7, 1), 
(4, 5, 2), 
(5, 2, 1), 
(5, 8, 1); 