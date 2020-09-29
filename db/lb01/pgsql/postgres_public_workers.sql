create table workers
(
    first_name  text    not null,
    last_name   text    not null,
    middle_name text,
    id          serial  not null
        constraint workers_pk
            primary key,
    depo_id     integer not null
        constraint workers_depo_id_fk
            references depo,
    position    text    not null,
    reports_to  integer
        constraint workers_workers_id_fk
            references workers
);

INSERT INTO public.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to)
VALUES ('Тимофей', 'Тулаев', 'Кинсаевич', 3, 2, 'Инструктор', null);
INSERT INTO public.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to)
VALUES ('Арина', 'Аригава', 'Армановна', 2, 2, 'Кондуктор', 3);
INSERT INTO public.workers (first_name, last_name, middle_name, id, depo_id, position, reports_to)
VALUES ('Иван', 'Иванов', 'Иванович', 1, 2, 'Кондуктор', 3);
