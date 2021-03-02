package com.haulmont.samples.ratlab.web.screens.research;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.Research;

@UiController("ratlab_Research.browse")
@UiDescriptor("research-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class ResearchBrowse extends MasterDetailScreen<Research> {
}