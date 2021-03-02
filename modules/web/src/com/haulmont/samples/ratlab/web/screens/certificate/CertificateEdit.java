package com.haulmont.samples.ratlab.web.screens.certificate;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.stuff.Certificate;

@UiController("ratlab_Certificate.edit")
@UiDescriptor("certificate-edit.xml")
@EditedEntityContainer("certificateDc")
@LoadDataBeforeShow
public class CertificateEdit extends StandardEditor<Certificate> {
}