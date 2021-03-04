package com.haulmont.samples.ratlab.web.screens.research;


import com.haulmont.cuba.gui.Dialogs;
import com.haulmont.cuba.gui.actions.list.AddAction;
import com.haulmont.cuba.gui.actions.list.RefreshAction;
import com.haulmont.cuba.gui.actions.list.RemoveAction;
import com.haulmont.cuba.gui.components.Action;
import com.haulmont.cuba.gui.components.ButtonsPanel;
import com.haulmont.cuba.gui.model.CollectionContainer;
import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.research.Research;
import com.haulmont.samples.ratlab.entity.research.State;
import com.haulmont.samples.ratlab.entity.stuff.Employee;
import com.haulmont.samples.ratlab.service.ResearchService;

import javax.inject.Inject;
import javax.inject.Named;

@UiController("ratlab_Research.browse")
@UiDescriptor("research-browse.xml")
@LookupComponent("table")
@LoadDataBeforeShow
public class ResearchBrowse extends MasterDetailScreen<Research> {

    @Inject
    protected ButtonsPanel employeeEditButtonPanel;

    @Inject
    protected Dialogs dialogs;

    @Named("employeesTable.add")
    private AddAction<Employee> add;

    @Named("employeesTable.remove")
    private RemoveAction<Employee> remove;

    @Inject
    private ResearchService researchService;
    @Inject
    private CollectionContainer<Research> researchesDc;
    @Named("table.refresh")
    private RefreshAction tableRefresh;

    @Override
    protected void initEditComponents(boolean enabled) {
        super.initEditComponents(enabled);
        add.setEnabled(enabled);
        remove.setEnabled(enabled);
        employeeEditButtonPanel.setVisible(enabled);
    }

    @Subscribe("table.gatherResources")
    public void onTableGatherResources(Action.ActionPerformedEvent event) {
        Research research = getTable().getSingleSelected();
        try {
            researchService.gatherResources(research);
            tableRefresh.actionPerform(getTable());
            dialogs.createMessageDialog()
                    .withCaption("Completed")
                    .withMessage("Resources gathered")
                    .show();

        } catch (RuntimeException e) {
            dialogs.createMessageDialog()
                    .withType(Dialogs.MessageType.WARNING)
                    .withCaption("Cannot perform gathering")
                    .withMessage(e.getMessage())
                    .show();
        }


    }

    @Install(to = "table.gatherResources", subject = "enabledRule")
    private boolean tableGatherResourcesEnabledRule() {
        return getTable().getSelected().size() == 1 && getTable().getSingleSelected().getState() == State.CREATED;
    }

    @Subscribe("table.perform")
    public void onTablePerform(Action.ActionPerformedEvent event) {
        Research research = getTable().getSingleSelected();
        try {
            researchService.perform(research);
            tableRefresh.actionPerform(getTable());
            dialogs.createMessageDialog()
                    .withCaption("Completed")
                    .withMessage("Research completed")
                    .show();

        } catch (RuntimeException e) {
            dialogs.createMessageDialog()
                    .withType(Dialogs.MessageType.WARNING)
                    .withCaption("Cannot perform research")
                    .withMessage(e.getMessage())
                    .show();
        }
    }
}