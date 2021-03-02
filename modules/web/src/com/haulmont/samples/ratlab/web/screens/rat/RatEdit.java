package com.haulmont.samples.ratlab.web.screens.rat;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.resources.Rat;

@UiController("ratlab_Rat.edit")
@UiDescriptor("rat-edit.xml")
@EditedEntityContainer("ratDc")
@LoadDataBeforeShow
public class RatEdit extends StandardEditor<Rat> {
}