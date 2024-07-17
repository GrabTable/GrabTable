SET FOREIGN_KEY_CHECKS = 0;
drop table if exists reservation;
drop table if exists cart;
drop table if exists menu;
drop table if exists orders;
drop table if exists pay_one_bill;
drop table if exists review;
drop table if exists shared_order;
drop table if exists store;
drop table if exists users;

create table cart
(
    quantity         integer,
    unit_price       integer,
    created_at       datetime(6),
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    order_id         bigint,
    shared_order_id  bigint,
    user_id          bigint,
    menu_name        varchar(255),
    primary key (id)
) engine = InnoDB;
create table menu
(
    price            integer,
    created_at       datetime(6),
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    store_id         bigint,
    menu_name        varchar(255),
    menu_picture_url varchar(255),
    status           enum ('VALID','INVALID'),
    primary key (id)
) engine = InnoDB;
create table orders
(
    total_price      integer,
    created_at       datetime(6),
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    reservation_id   bigint,
    shared_order_id  bigint,
    user_id          bigint,
    payment_method   varchar(255),
    request          varchar(255),
    status           enum ('PAID','PENDING','CANCELED'),
    primary key (id)
) engine = InnoDB;
create table pay_one_bill
(
    amount       decimal(38, 2),
    id           bigint not null auto_increment,
    imp_uid      varchar(255),
    merchant_uid varchar(255),
    receipt_url  varchar(255),
    primary key (id)
) engine = InnoDB;
create table reservation
(
    created_at       datetime(6),
    host_id          bigint,
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    shared_order_id  bigint,
    store_id         bigint,
    invite_code      varchar(255),
    status           enum ('CANCELED','ONGOING','CONFIRMED'),
    primary key (id)
) engine = InnoDB;
create table review
(
    rating           float(53),
    created_at       datetime(6),
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    store_id         bigint,
    user_id          bigint,
    message          varchar(1000),
    review_platform  enum ('NAVER','KAKAO','GRABTABLE'),
    status           enum ('VALID','INVALID'),
    primary key (id)
) engine = InnoDB;
create table shared_order
(
    created_at       datetime(6),
    id               bigint not null auto_increment,
    last_modified_at datetime(6),
    order_status     enum ('PAID','PENDING','CANCELED'),
    primary key (id)
) engine = InnoDB;
create table store
(
    latitude          float(53),
    longitude         float(53),
    created_at        datetime(6),
    id                bigint not null auto_increment,
    last_modified_at  datetime(6),
    address           varchar(255),
    description       varchar(255),
    phone             varchar(255),
    store_name        varchar(255),
    store_picture_url varchar(255),
    category          enum ('KOREAN','JAPANESE','CHINESE','AMERICAN','ASIAN'),
    status            enum ('VALID','INVALID'),
    primary key (id)
) engine = InnoDB;
create table users
(
    created_at             datetime(6),
    id                     bigint not null auto_increment,
    invited_reservation_id bigint,
    last_modified_at       datetime(6),
    email                  varchar(255),
    password               varchar(255),
    phone                  varchar(255),
    profile_image_url      varchar(255),
    social_login_id        varchar(255),
    username               varchar(255),
    primary key (id)
) engine = InnoDB;
alter table reservation
    add constraint UK_4gobkw2dx75q1d8bk1ueq4e25 unique (host_id);
alter table reservation
    add constraint UK_qhgb3i8liuk0jqfhiqj4iptax unique (shared_order_id);
alter table cart
    add constraint FK3xdjlr8pvm6waf3brpkvrcc6d foreign key (order_id) references orders (id);
alter table cart
    add constraint FK4swmuib04t0s2hwkvks3gpo15 foreign key (shared_order_id) references shared_order (id);
alter table cart
    add constraint FKg5uhi8vpsuy0lgloxk2h4w5o6 foreign key (user_id) references users (id);
alter table menu
    add constraint FK4sgenfcmk1jajhgctnkpn5erg foreign key (store_id) references store (id);
alter table orders
    add constraint FKb4kt2247gqu2qn1apw1uhnhw4 foreign key (reservation_id) references reservation (id);
alter table orders
    add constraint FKsc86dkfrdaerkwqx89rwyhcu2 foreign key (shared_order_id) references shared_order (id);
alter table orders
    add constraint FK32ql8ubntj5uh44ph9659tiih foreign key (user_id) references users (id);
alter table reservation
    add constraint FK75p521c6i3ybdg5n4vuv6awdn foreign key (host_id) references users (id);
alter table reservation
    add constraint FK48qs1vnlwond6h3a2y3jmypir foreign key (shared_order_id) references shared_order (id);
alter table reservation
    add constraint FKi3wg5pq3qkuxx7e6csndvce63 foreign key (store_id) references store (id);
alter table review
    add constraint FK74d12ba8sxxu9vpnc59b43y30 foreign key (store_id) references store (id);
alter table review
    add constraint FK6cpw2nlklblpvc7hyt7ko6v3e foreign key (user_id) references users (id);
alter table users
    add constraint FKm3mef72db6ms9ferhihw0fmua foreign key (invited_reservation_id) references reservation (id);

SET FOREIGN_KEY_CHECKS = 1;