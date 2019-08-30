package org.bahmni.reports.web;

import net.sf.dynamicreports.report.constant.PageType;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

public class ReportParams implements Serializable {

    private String startDate;
    private String endDate;
    private String name;
    private String responseType;
    private String macroTemplateLocation;
    private String paperSize;
    private String appName;
    private String userName;
    private String titleKey;
    private String locale;

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getName() throws UnsupportedEncodingException {
        return URLDecoder.decode(name, "UTF-8");
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getResponseType() {
        return responseType;
    }

    public void setResponseType(String responseType) {
        this.responseType = responseType;
    }

    public String getMacroTemplateLocation() {
        return macroTemplateLocation;
    }

    public void setMacroTemplateLocation(String macroTemplateLocation) {
        this.macroTemplateLocation = macroTemplateLocation;
    }

    public PageType getPaperSize() {
        return "A3".equals(paperSize) ? PageType.A3 : PageType.A4;
    }

    public void setPaperSize(String paperSize) {
        this.paperSize = paperSize;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public String getAppName() {
        return appName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTitleKey() {
        return titleKey != null ? titleKey : name;
    }

    public void setTitleKey(String titleKey) {
        this.titleKey = titleKey;
    }

    public String getLocale() {
        return locale;
    }

    public void setLocale(String locale) {
        this.locale = locale;
    }
}
