package org.bahmni.reports.util;

import org.junit.Assert;
import org.junit.Test;

import java.util.ResourceBundle;

public class BahmniLocaleUtilTest {
    private static final String LOCALE_FILE_NAME = "locale_test";

    @Test
    public void shouldGetResourceBundleInEn() {
        BahmniLocale.setLocaleName("en");
        Assert.assertEquals(BahmniLocale.getLocaleName(), "en");
        ResourceBundle resourceBundle = BahmniLocale.getResourceBundle(LOCALE_FILE_NAME);
        Assert.assertEquals(resourceBundle.getString("test"), "Test");
        Assert.assertEquals(resourceBundle.getString("FROM"), "From");
    }

    @Test
    public void shouldGetResourceBundleInPt() {
        BahmniLocale.setLocaleName("pt");
        Assert.assertEquals(BahmniLocale.getLocaleName(), "pt");
        ResourceBundle resourceBundle = BahmniLocale.getResourceBundle(LOCALE_FILE_NAME);
        Assert.assertEquals(resourceBundle.getString("test"), "Teste");
        Assert.assertEquals(resourceBundle.getString("FROM"), "De");

    }

    @Test
    public void shouldGetStringInUTF8() {
        BahmniLocale.setLocaleName("pt");
        Assert.assertEquals(BahmniLocale.getLocaleName(), "pt");
        Assert.assertEquals(BahmniLocale.getString(LOCALE_FILE_NAME, "GENERATED"), "Relatório gerado em");

    }
}
