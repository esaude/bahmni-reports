package org.bahmni.reports.util;

import java.util.Locale;
import java.util.ResourceBundle;

public class BahmniLocale {
    public static String localeName = "pt";
    private static Locale locale;
    private static final String LOCALE_FILE_NAME = "locale";

    public  static void setLocaleName(String localeName){
        BahmniLocale.localeName = localeName;
        locale = new Locale(localeName);
    }

    public static String getLocaleName(){
        return localeName;
    }

    public static Locale getLocale(){
        if ( locale == null) {
            locale = new Locale(localeName);
        }
        return locale;
    }

    public static ResourceBundle getResourceBundle(){
        return ResourceBundle.getBundle(LOCALE_FILE_NAME, getLocale());
    }

    public static ResourceBundle getResourceBundle(String filename){
        return ResourceBundle.getBundle(filename, getLocale());
    }
}
