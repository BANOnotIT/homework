create table stations
(
    name        text              not null,
    line_color  text              not null,
    date        date              not null,
    lines_count integer default 2 not null,
    id          serial            not null
        constraint stations_pk
            primary key,
    depo_id     integer
        constraint stations_depo_id_fk
            references depo
            on update set null
);

INSERT INTO public.stations (name, line_color, date, lines_count, id, depo_id)
VALUES ('Щёлковская', 'blue', '1963-07-22', 2, 1, 3);
