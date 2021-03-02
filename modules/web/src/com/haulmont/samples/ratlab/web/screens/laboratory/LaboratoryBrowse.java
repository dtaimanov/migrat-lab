package com.haulmont.samples.ratlab.web.screens.laboratory;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.Laboratory;

@UiController("ratlab_Laboratory.browse")
@UiDescriptor("laboratory-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class LaboratoryBrowse extends MasterDetailScreen<Laboratory> {
}