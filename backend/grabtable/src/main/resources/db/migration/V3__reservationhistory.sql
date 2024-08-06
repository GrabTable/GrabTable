SET FOREIGN_KEY_CHECKS = 0;
create table reservation_history
(
    created_at       datetime(6),
    last_modified_at  datetime(6),
    host_id          bigint,
    id               bigint not null auto_increment,
    store_id         bigint,
    shared_order_id  bigint,
    primary key (id)
) engine = InnoDB;
create table invited_reservation_history
(
    created_at       datetime(6),
    last_modified_at  datetime(6),
    id               bigint not null auto_increment,
    reservation_history_id          bigint,
    invitee_id          bigint,
    primary key (id)
) engine = InnoDB;

alter table reservation_history
    add constraint FKasdjksj1wdjklwdjq0dijsdkj foreign key (store_id) REFERENCES store (id);
alter table reservation_history
    add constraint FKaskjdsjakdl12jds9d2jdksdw foreign key (host_id) REFERENCES users (id);
alter table reservation_history
    add constraint FK12j3kjdjksdjqlkdwjdiqwhdw foreign key (shared_order_id) REFERENCES shared_order (id);
alter table invited_reservation_history
    add constraint FKadjksajd1js0djslakdjlkqvb foreign key (reservation_history_id) REFERENCES reservation_history (id);
alter table invited_reservation_history
    add constraint FK9s8dsajdkqsjdl1nsklcaxhqs foreign key (invitee_id) REFERENCES users (id);

SET FOREIGN_KEY_CHECKS = 1;