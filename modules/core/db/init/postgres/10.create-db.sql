-- begin RATLAB_LABORATORY
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
)^
-- end RATLAB_LABORATORY
-- begin RATLAB_RAT
create table RATLAB_RAT (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255),
    COLOR varchar(255),
    CHECKED boolean,
    --
    primary key (ID)
)^
-- end RATLAB_RAT
-- begin RATLAB_CERTIFICATE
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
)^
-- end RATLAB_CERTIFICATE
-- begin RATLAB_RESEARCH
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
)^
-- end RATLAB_RESEARCH
-- begin RATLAB_MISC_RESOURCE
create table RATLAB_MISC_RESOURCE (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    NAME varchar(255),
    AMOUNT decimal(19, 2),
    TYPE_ varchar(50) not null,
    --
    primary key (ID)
)^
-- end RATLAB_MISC_RESOURCE
-- begin RATLAB_EMPLOYEE
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
)^
-- end RATLAB_EMPLOYEE
-- begin RATLAB_EMPLOYEE_RESEARCH_LINK
create table RATLAB_EMPLOYEE_RESEARCH_LINK (
    EMPLOYEE_ID uuid,
    RESEARCH_ID uuid,
    primary key (EMPLOYEE_ID, RESEARCH_ID)
)^
-- end RATLAB_EMPLOYEE_RESEARCH_LINK
