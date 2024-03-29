alter table ratlab_subject_requirement add constraint FK_RATLAB_SUBJECT_REQUIREMENT_ON_RESEARCH foreign key (RESEARCH_ID) references RATLAB_RESEARCH(ID);
alter table ratlab_subject_requirement add constraint FK_RATLAB_SUBJECT_REQUIREMENT_ON_SUBJECT foreign key (SUBJECT_ID) references RATLAB_RAT(ID);
create index IDX_RATLAB_SUBJECT_REQUIREMENT_ON_RESEARCH on ratlab_subject_requirement (RESEARCH_ID);
create index IDX_RATLAB_SUBJECT_REQUIREMENT_ON_SUBJECT on ratlab_subject_requirement (SUBJECT_ID);
