package com.haulmont.samples.ratlab.web.screens.certificate;

import com.haulmont.cuba.gui.screen.*;
import com.haulmont.samples.ratlab.entity.stuff.Certificate;

@UiController("ratlab_Certificate.browse")
@UiDescriptor("certificate-browse.xml")
@LookupComponent("certificatesTable")
@LoadDataBeforeShow
public class CertificateBrowse extends StandardLookup<Certificate> {
}