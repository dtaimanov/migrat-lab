create table RATLAB_RESEARCH_REQUIREMENT (
    ID uuid,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    DTYPE varchar(31),
    --
    RESEARCH_ID uuid not null,
    MANDATORY boolean not null,
    --
    -- from ratlab_SubjectRequirement
    SUBJECT_ID uuid not null,
    --
    -- from ratlab_ResourceRequirement
    RESOURCE_ID uuid not null,
    PROVIDED integer,
    AMOUNT integer not null,
    CONSUME boolean default false,
    --
    primary key (ID)
);