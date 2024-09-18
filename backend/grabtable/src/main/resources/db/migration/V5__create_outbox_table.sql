CREATE TABLE outbox_message
(
    id               bigint                                   NOT NULL AUTO_INCREMENT,
    type             enum ('INIT','SEND_SUCCESS','SEND_FAIL') NOT NULL,
    payload          longtext                                 NOT NULL,
    created_at       datetime(6),
    last_modified_at datetime(6),
    PRIMARY KEY (id)
) engine = Innodb;

CREATE TABLE processed_message
(
    id bigint NOT NULL,
    PRIMARY KEY (id)
) engine = Innodb;


