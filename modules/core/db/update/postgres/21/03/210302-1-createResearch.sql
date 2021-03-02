create table RATLAB_RESEARCH (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    TITLE varchar(255) not null,
    START_TIME timestamp with time zone not null,
    DESCRIPTION text,
    --
    primary key (ID)
);