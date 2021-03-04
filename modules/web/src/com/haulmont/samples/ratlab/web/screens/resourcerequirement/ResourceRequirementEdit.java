package com.haulmont.samples.ratlab.web.screens.resourcerequirement;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.research.ResourceRequirement;

@UiController("ratlab_ResourceRequirement.edit")
@UiDescriptor("resource-requirement-edit.xml")
@EditedEntityContainer("resourceRequirementDc")
@LoadDataBeforeShow
public class ResourceRequirementEdit extends StandardEditor<ResourceRequirement> {
}