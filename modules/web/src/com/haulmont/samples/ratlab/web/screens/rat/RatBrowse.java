package com.haulmont.samples.ratlab.web.screens.rat;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.resources.Rat;

@UiController("ratlab_Rat.browse")
@UiDescriptor("rat-browse.xml")
@LookupComponent("ratsTable")
@LoadDataBeforeShow
public class RatBrowse extends StandardLookup<Rat> {
}