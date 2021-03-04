create table RATLAB_RESOURCE_REQUIREMENT (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    --
    RESEARCH_ID uuid not null,
    PROVIDED integer,
    AMOUNT integer not null,
    CONSUME boolean,
    --
    primary key (ID)
);