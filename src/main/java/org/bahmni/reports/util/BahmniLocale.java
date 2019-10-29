package org.bahmni.reports.util;

import java.io.UnsupportedEncodingException;
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

    public static String getString(String key){
        String val = getResourceBundle().getString(key);
        try {
            return new String(val.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return getResourceBundle().getString(key);
    }

    public static String getString(String filename, String key){
        String val = getResourceBundle(filename).getString(key);
        try {
            return new String(val.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return getResourceBundle().getString(key);
    }
}
