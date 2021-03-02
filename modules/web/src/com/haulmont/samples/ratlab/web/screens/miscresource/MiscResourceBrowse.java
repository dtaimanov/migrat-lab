package com.haulmont.samples.ratlab.web.screens.miscresource;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.resources.MiscResource;

@UiController("ratlab_MiscResource.browse")
@UiDescriptor("misc-resource-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class MiscResourceBrowse extends MasterDetailScreen<MiscResource> {
}