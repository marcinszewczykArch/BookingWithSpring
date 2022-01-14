SET FOREIGN_KEY_CHECKS = 0;

--
--create table task_manager--
--
DROP TABLE IF EXISTS task_manager;
CREATE TABLE task_manager
(
    `id` bigint NOT NULL,
    `task` varchar(256) DEFAULT NULL,
    `frequency_Minutes` int DEFAULT NULL,
    `last_Execution` datetime DEFAULT NULL,
    `next_Execution` datetime DEFAULT NULL,
    `duration_Milisec` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table apartment--
--
DROP TABLE IF EXISTS apartment;
CREATE TABLE `apartment` (
     `id` bigint NOT NULL AUTO_INCREMENT,
     `address` varchar(255) DEFAULT NULL,
     `airbnb_link` varchar(255) DEFAULT NULL,
     `apartment_name` varchar(255) DEFAULT NULL,
     `guests_number` int NOT NULL,
     `image` varchar(255) DEFAULT NULL,
     `size` int NOT NULL,
     `owner_id` bigint DEFAULT NULL,
     PRIMARY KEY (`id`)
);

--
--create table cleaning--
--
DROP TABLE IF EXISTS cleaning;
CREATE TABLE `cleaning` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `cleaning_date` date DEFAULT NULL,
    `extra_bedding` int NOT NULL,
    `is_done` bit(1) NOT NULL,
    `cleaning_person_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table cleaning_person--
--
DROP TABLE IF EXISTS cleaning_person;
CREATE TABLE cleaning_person (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `is_availabe` bit(1) DEFAULT 1,
    `work_end` date DEFAULT NULL,
    `work_start` date DEFAULT NULL,
    `people_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table owner--
--
DROP TABLE IF EXISTS owner;
CREATE TABLE owner (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `people_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table people--
--
DROP TABLE IF EXISTS people;
CREATE TABLE people (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `email` varchar(255) DEFAULT NULL,
    `first_name` varchar(255) DEFAULT NULL,
    `last_name` varchar(255) DEFAULT NULL,
    `phone_number` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table reservation--
--
DROP TABLE IF EXISTS reservation;
CREATE TABLE reservation (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `adults` int DEFAULT NULL,
    `check_in` date DEFAULT NULL,
    `check_out` date DEFAULT NULL,
    `children` int DEFAULT NULL,
    `guest_country` varchar(255) DEFAULT NULL,
    `guest_name` varchar(255) DEFAULT NULL,
    `money_transfer` double DEFAULT NULL,
    `reservation_code` varchar(255) DEFAULT NULL,
    `reservation_date` date DEFAULT NULL,
    `small_children` int DEFAULT NULL,
    `stay_duration` int DEFAULT NULL,
    `apartment_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);

--
--create table user--
--
DROP TABLE IF EXISTS user;
CREATE TABLE user (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `login` varchar(255) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `user_role` int DEFAULT NULL,
    `people_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`)
);