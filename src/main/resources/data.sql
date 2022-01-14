--
--insert tasks--
--
INSERT INTO task_manager
    (id, task, frequency_Minutes)
VALUES
    (1, 'airbnbReservations', 2);

--
--insert people--
--
INSERT INTO people
(email, first_name, last_name, phone_number)
VALUES
    ('kp94m3@gmail.com', 'Marcin', 'Szewczyk', '602317995'),
    ('ko@gmail.com', 'Konrad', 'Onderko', '666555444'),
    ('gosiap@gmail.com', 'Gosia', 'Podgórny', '666522240'),
    ('ko@gmail.com', 'Beata', 'Onderko', '666555444');

--
--insert owners--
--
INSERT INTO owner
    (people_id)
VALUES
    (1),
    (4);

--
--insert cleaners--
--
INSERT INTO cleaning_person
    (people_id)
VALUES
    (1),
    (2),
    (3),
    (4);

--
--insert apartments--
--
INSERT INTO apartment
    (address, airbnb_link, apartment_name, guests_number, image, size, owner_id)
VALUES
    ('Komuny Paryskiej 94/3',
    'https://airbnb.com/h/slonecznakamienica',
    'Słoneczna kamienica - apartament z lustrem',
    3,
    'https://a0.muscache.com/im/pictures/miso/Hosting-45055284/original/9e2b6df6-6b5f-48eb-80e1-d37cc68220a4.jpeg?im_w=1200',
    29,
    1),

    ('Komuny Paryskiej 94/3',
     'https://airbnb.com/h/slonecznakamienica',
     'Słoneczna kamienica - apartament z balkonem',
     4,
     'https://a0.muscache.com/im/pictures/miso/Hosting-44638934/original/ecc5b0d1-f95d-460a-a177-3001143f4bdc.jpeg?im_w=1200',
     29,
     1),

    ('Komuny Paryskiej 94/3',
     'https://airbnb.com/h/slonecznakamienica',
     'Słoneczna kamienica - CAŁE',
     7,
     'https://a0.muscache.com/im/pictures/miso/Hosting-45237021/original/6fc5378c-c2e2-4a5e-b448-9a421b6243fa.jpeg?im_w=1200',
     65,
     1),

    ('Aleksandra Hercena 34',
     'https://www.airbnb.pl/rooms/45117982',
     'Hercena Kołokoł - design apartment',
     2,
     'https://a0.muscache.com/im/pictures/miso/Hosting-45117982/original/1447b673-0d04-4c22-8ff1-0e71e9a2a9d6.jpeg?im_w=1200',
     34,
     2),

    ('Aleksandra Hercena 34',
     'https://www.airbnb.pl/rooms/45117982',
     'Hercena Polarnaja Zwiezda - design apartment',
     2,
     'https://a0.muscache.com/im/pictures/miso/Hosting-45255708/original/bf8fa553-281b-4751-a6f8-17ee1faf2bfa.jpeg?im_w=1200',
     34,
     2),

    ('Kniaziewicza 12',
     'https://www.airbnb.pl/rooms/50165522',
     'Hercena Polarnaja Zwiezda - design apartment',
     2,
     'https://a0.muscache.com/im/pictures/miso/Hosting-50165522/original/52d48a49-a2c6-48c8-93d4-a32aed0bd619.jpeg?im_w=1200',
     31,
     2),

    ('Kniaziewicza 12',
     'https://www.airbnb.pl/rooms/50165522',
     'Kniaziewicza Sommeil - design apartment',
     2,
     'https://a0.muscache.com/im/pictures/miso/Hosting-50165522/original/52d48a49-a2c6-48c8-93d4-a32aed0bd619.jpeg?im_w=1200',
     31,
     2);



