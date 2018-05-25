CREATE DATABASE hotel CHARACTER SET 'utf8';

CREATE TABLE categories (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE states (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE bathrooms (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE beds (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	description VARCHAR(45) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE guests (
	id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	phone_number VARCHAR(45) NOT NULL,
	email VARCHAR(45) NOT NULL,
	address VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE services (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description TEXT NOT NULL,
    cost FLOAT NOT NULL,
    availability BOOLEAN NOT NULL,
    category SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_category
        FOREIGN KEY (category)
        REFERENCES categories(id)
) ENGINE=InnoDB;

CREATE TABLE rooms (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    area FLOAT NOT NULL,
    kind_room BOOLEAN NOT NULL,
    floor SMALLINT NOT NULL,
    view VARCHAR(45) NOT NULL,
    accessibility BOOLEAN NOT NULL,
    cost FLOAT NOT NULL,
    bathroom SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_bathroom
        FOREIGN KEY (bathroom)
        REFERENCES bathrooms(id),
    bed SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_bed
        FOREIGN KEY (bed)
        REFERENCES beds(id)
) ENGINE=InnoDB;

CREATE TABLE bookings (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    arrival_date DATE NOT NULL,
    departure_date DATE NOT NULL,
    guest SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_guest
        FOREIGN KEY (guest)
        REFERENCES guests(id),
    state SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_state_status
        FOREIGN KEY (state)
        REFERENCES states(id)
) ENGINE=InnoDB;

CREATE TABLE bookings_services (
    booking SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_booking
        FOREIGN KEY (booking)
        REFERENCES bookings(id),
    service SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_service
        FOREIGN KEY (service)
        REFERENCES services(id)
) ENGINE=InnoDB;

CREATE TABLE bookings_rooms (
    booking SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_booking__rooms
        FOREIGN KEY (booking)
        REFERENCES bookings(id),
    room SMALLINT UNSIGNED NOT NULL,
    CONSTRAINT fk_room
        FOREIGN KEY (room)
        REFERENCES rooms(id)
) ENGINE=InnoDB;

