package com.haulmont.samples.ratlab.web.screens.employee;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.stuff.Employee;

@UiController("ratlab_Employee.edit")
@UiDescriptor("employee-edit.xml")
@EditedEntityContainer("employeeDc")
@LoadDataBeforeShow
public class EmployeeEdit extends StandardEditor<Employee> {
}