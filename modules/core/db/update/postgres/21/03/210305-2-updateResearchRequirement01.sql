update RATLAB_RESEARCH_REQUIREMENT set PROVIDED = 0 where PROVIDED is null ;
alter table RATLAB_RESEARCH_REQUIREMENT alter column PROVIDED set not null ;
