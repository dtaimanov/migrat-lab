alter table RATLAB_RESOURCE_REQUIREMENT add constraint FK_RATLAB_RESOURCE_REQUIREMENT_ON_RESOURCE foreign key (RESOURCE_ID) references RATLAB_MISC_RESOURCE(ID);
create index IDX_RATLAB_RESOURCE_REQUIREMENT_ON_RESOURCE on RATLAB_RESOURCE_REQUIREMENT (RESOURCE_ID);