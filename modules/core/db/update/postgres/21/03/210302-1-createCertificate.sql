create table RATLAB_CERTIFICATE (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    TITLE varchar(255),
    AQUIRED timestamp not null,
    CODE varchar(255) not null,
    DESCRIPTION text,
    OWNER_ID uuid,
    --
    primary key (ID)
);