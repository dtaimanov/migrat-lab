alter table RATLAB_MISC_RESOURCE add column CONSUMABLE boolean default true ^
update RATLAB_MISC_RESOURCE set CONSUMABLE = false where CONSUMABLE is null ;
alter table RATLAB_MISC_RESOURCE alter column CONSUMABLE set not null ;
