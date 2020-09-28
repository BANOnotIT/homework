
create table workers
(
    first_name  text    char set utf8mb4 not null,
    last_name   text    char set utf8mb4 not null,
    middle_name text 	char set utf8mb4,
    id          serial  not null
            primary key,
    depo_id     integer not null references depo(id),
    position    text   char set utf8mb4 not null,
    reports_to  integer
);

INSERT INTO metro.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to) VALUES ('Тимофей', 'Тулаев', 'Кинсаевич', 3, 2, 'Инструктор', null);
INSERT INTO metro.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to) VALUES ('Арина', 'Аригава', 'Армановна', 2, 2, 'Кондуктор', 3);
INSERT INTO metro.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to) VALUES ('Иван', 'Иванов', 'Иванович', 1, 2, 'Кондуктор', 3);
