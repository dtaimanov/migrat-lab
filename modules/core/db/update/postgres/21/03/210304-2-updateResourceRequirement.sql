-- alter table RATLAB_RESOURCE_REQUIREMENT add column RESOURCE_ID uuid ^
-- update RATLAB_RESOURCE_REQUIREMENT set RESOURCE_ID = <default_value> ;
-- alter table RATLAB_RESOURCE_REQUIREMENT alter column RESOURCE_ID set not null ;
alter table RATLAB_RESOURCE_REQUIREMENT add column RESOURCE_ID uuid not null ;
