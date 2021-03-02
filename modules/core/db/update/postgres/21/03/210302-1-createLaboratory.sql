create table RATLAB_LABORATORY (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    ADDRESS_COUNTRY varchar(255),
    ADDRESS_TOWN varchar(255),
    ADDRESS_FIELD1 varchar(255),
    ADDRESS_LATITUDE double precision,
    ADDRESS_LONGITUDE double precision,
    ADDRESS_FIELD2 varchar(255),
    ADDRESS_FIELD3 varchar(255),
    ADDRESS_FIELD4 varchar(255),
    ADDRESS_FIELD5 varchar(255),
    --
    TITLE varchar(255) not null,
    DESCRIPTION varchar(255),
    DAY_START time not null,
    DAY_END time,
    CODE varchar(255) not null,
    --
    primary key (ID)
);