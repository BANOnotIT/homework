create table depo
(
    name            text   not null,
    foundation_date date   not null,
    id              serial not null
        constraint depo_pk
            primary key
);

INSERT INTO public.depo (name, foundation_date, id) VALUES ('Северное', '1935-04-26', 1);
INSERT INTO public.depo (name, foundation_date, id) VALUES ('Сокол', '1938-09-10', 2);
INSERT INTO public.depo (name, foundation_date, id) VALUES ('Измайлово', '1950-01-14', 3);
INSERT INTO public.depo (name, foundation_date, id) VALUES ('Красная Пресня', '1954-04-01', 4);
INSERT INTO public.depo (name, foundation_date, id) VALUES ('Калужское', '1962-10-13', 5);
INSERT INTO public.depo (name, foundation_date, id) VALUES ('Планерное', '1975-12-28', 6);
