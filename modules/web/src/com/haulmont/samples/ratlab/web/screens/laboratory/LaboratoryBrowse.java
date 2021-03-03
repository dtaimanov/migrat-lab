package com.haulmont.samples.ratlab.web.screens.laboratory;

import com.haulmont.cuba.gui.actions.list.AddAction;
import com.haulmont.cuba.gui.actions.list.RemoveAction;
import com.haulmont.cuba.gui.components.ButtonsPanel;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.Laboratory;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

import javax.inject.Inject;
import javax.inject.Named;

@UiController("ratlab_Laboratory.browse")
@UiDescriptor("laboratory-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class LaboratoryBrowse extends MasterDetailScreen<Laboratory> {
    @Named("employeesTable.add")
    private AddAction<Employee> employeesTableAdd;
    @Named("employeesTable.remove")
    private RemoveAction<Employee> employeesTableRemove;
    @Inject
    private ButtonsPanel employeesTableBP;

    @Override
    protected void initEditComponents(boolean enabled) {
        super.initEditComponents(enabled);
        employeesTableAdd.setEnabled(enabled);
        employeesTableRemove.setEnabled(enabled);
        employeesTableBP.setVisible(enabled);
    }
}