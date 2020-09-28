
create table depo
(
    name            text char set utf8mb4 not null,
    foundation_date date   not null,
    id              serial not null            primary key
);

INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Северное', '1935-04-26', 1);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Сокол', '1938-09-10', 2);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Измайлово', '1950-01-14', 3);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Красная Пресня', '1954-04-01', 4);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Калужское', '1962-10-13', 5);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Планерное', '1975-12-28', 6);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Замоскворецкое', '1969-07-10', 7);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Варшавское', '1983-11-04', 8);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Фили', '1962-01-01', 9);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Свиблово', '1978-09-30', 10);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Выхино', '1966-12-12', 11);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Новогиреево', '1979-12-30', 12);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Черкизово', '1990-06-24', 13);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Владыкино', '1991-03-01', 14);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Печатники', '1995-12-28', 15);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Митино', '2016-12-24', 16);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Братеево', '2014-01-15', 17);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Солнцево', '2018-08-30', 18);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Лихоборы', '2018-06-11', 19);
INSERT INTO metro.depo (name, foundation_date, id) VALUES ('Руднёво', '2019-06-03', 20);
