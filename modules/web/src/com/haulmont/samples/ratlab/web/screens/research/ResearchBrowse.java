package com.haulmont.samples.ratlab.web.screens.research;


import com.haulmont.cuba.gui.actions.list.RemoveAction;
import com.haulmont.cuba.gui.components.ButtonsPanel;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.Research;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

import javax.inject.Inject;
import javax.inject.Named;

@UiController("ratlab_Research.browse")
@UiDescriptor("research-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class ResearchBrowse extends MasterDetailScreen<Research> {

    @Inject
    protected ButtonsPanel employeeEditButtonPanel;

    @Named("employeesTable.add")
    private com.haulmont.cuba.gui.actions.list.AddAction<Employee> add;

    @Named("employeesTable.remove")
    private RemoveAction<Employee> remove;

    @Override
    protected void initEditComponents(boolean enabled) {
        super.initEditComponents(enabled);
        add.setEnabled(enabled);
        remove.setEnabled(enabled);
        employeeEditButtonPanel.setVisible(enabled);
    }
}