create table RATLAB_EMPLOYEE (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    HOME_ADDRESS_COUNTRY varchar(255),
    HOME_ADDRESS_TOWN varchar(255),
    HOME_ADDRESS_FIELD1 varchar(255),
    HOME_ADDRESS_LATITUDE double precision,
    HOME_ADDRESS_LONGITUDE double precision,
    HOME_ADDRESS_FIELD2 varchar(255),
    HOME_ADDRESS_FIELD3 varchar(255),
    HOME_ADDRESS_FIELD4 varchar(255),
    HOME_ADDRESS_FIELD5 varchar(255),
    --
    NAME varchar(255),
    POSITION_ varchar(50) not null,
    EXPERIENCE integer not null,
    SINCE timestamp not null,
    LABORATORY_ID uuid,
    SUPERVISOR_ID uuid,
    --
    primary key (ID)
);