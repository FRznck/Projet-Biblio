DROP DATABASE IF EXISTS bibliotheque;
CREATE DATABASE bibliotheque;
USE bibliotheque;

-- Table livres
CREATE TABLE livres (
    id_livre INT AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    nb_livre_disponible INT NOT NULL,
    livre_description VARCHAR(1000),
    CONSTRAINT livre_pk PRIMARY KEY (id_livre)
) ENGINE=InnoDB;

-- Table livres_photo_path
CREATE TABLE livres_photo_path (
    id_livre INT NOT NULL,
    photo_path VARCHAR(255) NOT NULL,
    CONSTRAINT fk_id_livre FOREIGN KEY (id_livre) REFERENCES livres(id_livre) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table categories
CREATE TABLE categories (
    id_categorie INT AUTO_INCREMENT,
    nom_categorie VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT categorie_pk PRIMARY KEY (id_categorie)
) ENGINE=InnoDB;

-- Junction table for many-to-many relationship between livres and categories
CREATE TABLE livres_categories (
    id_livre INT NOT NULL,
    id_categorie INT NOT NULL,
    CONSTRAINT fk_livres FOREIGN KEY (id_livre) REFERENCES livres(id_livre) ON DELETE CASCADE,
    CONSTRAINT fk_categories FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie) ON DELETE CASCADE,
    PRIMARY KEY (id_livre, id_categorie)
) ENGINE=InnoDB;

-- Table utilisateurs
CREATE TABLE utilisateurs (
    id_utilisateur INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    CONSTRAINT utilisateur_pk PRIMARY KEY (id_utilisateur)
) ENGINE=InnoDB;

-- Table emprunts
CREATE TABLE emprunts (
    id_emprunt INT AUTO_INCREMENT,
    id_livre INT NOT NULL,
    id_utilisateur INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    CONSTRAINT emprunt_pk PRIMARY KEY (id_emprunt),
    CONSTRAINT fk_emprunts_livre FOREIGN KEY (id_livre) REFERENCES livres(id_livre) ON DELETE CASCADE,
    CONSTRAINT fk_emprunts_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table reservations
CREATE TABLE reservations (
    id_reservations INT AUTO_INCREMENT,
    id_livre INT NOT NULL,
    id_utilisateur INT NOT NULL,
    date_reservation DATE NOT NULL,
    CONSTRAINT reservation_pk PRIMARY KEY (id_reservations),
    CONSTRAINT fk_reservations_livre FOREIGN KEY (id_livre) REFERENCES livres(id_livre) ON DELETE CASCADE,
    CONSTRAINT fk_reservations_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table notifications
CREATE TABLE notifications (
    id_notification INT AUTO_INCREMENT,
    id_utilisateur INT NOT NULL,
    date_notif DATE NOT NULL,
    message TEXT NOT NULL,
    titre_notif VARCHAR(255) NOT NULL,
    CONSTRAINT notification_pk PRIMARY KEY (id_notification),
    CONSTRAINT fk_notifications_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Table abonnements
CREATE TABLE abonnements (
    id_abonnement INT AUTO_INCREMENT,
    id_utilisateur INT NOT NULL,
    id_admin INT NOT NULL,
    duree_abonnement INT NOT NULL,
    le_prix DECIMAL(10, 2) NOT NULL,
    payement_etat VARCHAR(50) NOT NULL,
    CONSTRAINT abonnement_pk PRIMARY KEY (id_abonnement),
    CONSTRAINT fk_abonnements_utilisateur FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE,
    CONSTRAINT fk_abonnements_admin FOREIGN KEY (id_admin) REFERENCES utilisateurs(id_utilisateur) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Insert testing data into livres
INSERT INTO livres (titre, auteur, nb_livre_disponible, livre_description)
VALUES
    ('Le Petit Prince', 'Antoine de Saint-Exupery', 5, 'A poetic tale of love and loss.'),
    ('1984', 'George Orwell', 10, 'A dystopian novel about totalitarianism.'),
    ('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 7, 'An exploration of human history.'),
    ('The Catcher in the Rye', 'J.D. Salinger', 8, 'A coming-of-age story.'),
    ('To Kill a Mockingbird', 'Harper Lee', 4, 'A novel about racial injustice.');

-- Insert testing data into categories
INSERT INTO categories (nom_categorie)
VALUES
    ('Fiction'),
    ('Non-Fiction'),
    ('Dystopian'),
    ('Classic'),
    ('Biography'),
    ('Science'),
    ('History'),
    ('Mystery'),
    ('Fantasy'),
    ('Romance'),
    ('Horror'),
    ('Self-Help'),
    ('Poetry'),
    ('Philosophy'),
    ('Children'),
    ('Young Adult'),
    ('Science Fiction'),
    ('Adventure'),
    ('Religion'),
    ('Health'),
    ('Travel'),
    ('Art'),
    ('Cookbook'),
    ('Humor'),
    ('Business'),
    ('Economics'),
    ('Technology'),
    ('Education'),
    ('Sports'),
    ('Politics'),
    ('Environment'),
    ('Law'),
    ('Music'),
    ('Drama'),
    ('Other');

-- Insert testing data into livres_categories
INSERT INTO livres_categories (id_livre, id_categorie)
VALUES
    (1, 1), -- Le Petit Prince is Fiction
    (2, 3), -- 1984 is Dystopian
    (3, 2), -- Sapiens is Non-Fiction
    (4, 1), -- The Catcher in the Rye is Fiction
    (5, 4); -- To Kill a Mockingbird is Classic

-- Insert testing data into utilisateurs
INSERT INTO utilisateurs (nom, prenom, email, role, mot_de_passe)
VALUES
    ('Doe', 'John', 'john.doe@example.com', 'admin', 'password123'),
    ('Smith', 'Anna', 'anna.smith@example.com', 'librarian', 'securepassword'),
    ('Brown', 'James', 'james.brown@example.com', 'member', 'memberpass1'),
    ('Taylor', 'Emily', 'emily.taylor@example.com', 'member', 'memberpass2'),
    ('Wilson', 'Michael', 'michael.wilson@example.com', 'member', 'memberpass3');

-- Insert testing data into emprunts
INSERT INTO emprunts (id_livre, id_utilisateur, date_emprunt, date_retour)
VALUES
    (1, 3, '2024-11-01', '2024-11-10'),
    (2, 4, '2024-11-02', NULL), -- Not yet returned
    (3, 5, '2024-11-03', '2024-11-08'),
    (4, 3, '2024-11-05', NULL), -- Not yet returned
    (5, 4, '2024-11-06', '2024-11-13');

-- Insert testing data into reservations
INSERT INTO reservations (id_livre, id_utilisateur, date_reservation)
VALUES
    (1, 4, '2024-11-10'),
    (2, 5, '2024-11-11'),
    (3, 3, '2024-11-12'),
    (4, 5, '2024-11-13'),
    (5, 3, '2024-11-14');

-- Insert testing data into notifications
INSERT INTO notifications (id_utilisateur, date_notif, message, titre_notif)
VALUES
    (3, '2024-11-09', 'Your loan for "Le Petit Prince" is due tomorrow.', 'Loan Reminder'),
    (4, '2024-11-10', '"1984" is now available for borrowing.', 'Book Availability'),
    (5, '2024-11-12', 'Your reservation for "Sapiens" has been confirmed.', 'Reservation Confirmation'),
    (3, '2024-11-13', 'Your loan for "The Catcher in the Rye" is overdue.', 'Overdue Reminder'),
    (4, '2024-11-15', '"To Kill a Mockingbird" is ready for collection.', 'Reservation Notification');

-- Insert testing data into abonnements
INSERT INTO abonnements (id_utilisateur, id_admin, duree_abonnement, le_prix, payement_etat)
VALUES
    (3, 1, 12, 120.00, 'Paid'),
    (4, 1, 6, 60.00, 'Pending'),
    (5, 1, 3, 30.00, 'Paid'),
    (3, 1, 6, 60.00, 'Paid'),
    (4, 1, 12, 120.00, 'Pending');
