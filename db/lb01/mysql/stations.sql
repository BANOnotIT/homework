
create table stations
(
    name        text char set utf8mb4 not null,
    line_color  text char set utf8mb4 not null,
    date        date                  not null,
    lines_count integer default 2     not null,
    id          serial                not null
        primary key,
    depo_id     integer
                                      references depo (id)
                                          on update set null
);


INSERT INTO metro.stations (name, line_color, date, lines_count, id, depo_id)
VALUES ('Щёлковская', 'blue', '1963-07-22', 2, 1, 3);