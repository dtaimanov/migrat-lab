create table ratlab_subject_requirement (
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
    SUBJECT_ID uuid not null,
    --
    primary key (ID)
);