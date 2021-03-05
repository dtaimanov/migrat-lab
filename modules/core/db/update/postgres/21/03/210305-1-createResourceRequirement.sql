create table ratlab_resource_requirement (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    RESEARCH_ID uuid not null,
    MANDATORY boolean not null,
    --
    RESOURCE_ID uuid not null,
    PROVIDED integer not null,
    AMOUNT integer not null,
    CONSUME boolean default false,
    --
    primary key (ID)
);