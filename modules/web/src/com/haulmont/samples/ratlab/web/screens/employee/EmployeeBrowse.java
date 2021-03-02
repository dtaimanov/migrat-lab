package com.haulmont.samples.ratlab.web.screens.employee;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

@UiController("ratlab_Employee.browse")
@UiDescriptor("employee-browse.xml")
@LookupComponent("employeesTable")
@LoadDataBeforeShow
public class EmployeeBrowse extends StandardLookup<Employee> {
}