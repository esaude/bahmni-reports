package org.bahmni.reports.web;

import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.component.HorizontalListBuilder;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import org.bahmni.reports.template.Templates;
import org.bahmni.reports.util.BahmniLocale;

import java.text.SimpleDateFormat;
import java.util.Date;

import static net.sf.dynamicreports.report.builder.DynamicReports.cmp;

public class ReportHeader {

    public JasperReportBuilder add(JasperReportBuilder jasperReportBuilder, String reportName, String startDate, String endDate) {
        HorizontalListBuilder headerList = cmp.horizontalList();

        addTitle(reportName, headerList);

        addDatesSubHeader(startDate, endDate, headerList);

        addReportGeneratedDateSubHeader(headerList);

        addVerticalGap(headerList);

        jasperReportBuilder.addTitle(headerList);

        return jasperReportBuilder;
    }

    public JasperReportBuilder add(JasperReportBuilder jasperReportBuilder, String reportName, String title, String startDate, String endDate) {
        HorizontalListBuilder headerList = cmp.horizontalList();

        addTitle(title, headerList);

        addDatesSubHeader(startDate, endDate, headerList);

        addReportGeneratedDateSubHeader(headerList);

        addVerticalGap(headerList);

        jasperReportBuilder.addTitle(headerList);

        return jasperReportBuilder;
    }

    private void addVerticalGap(HorizontalListBuilder headerList) {
        headerList.add(cmp.line())
                .add(cmp.verticalGap(10));
    }

    private void addTitle(String reportName, HorizontalListBuilder headerList) {
        headerList.add(cmp.text(reportName)
                .setStyle(Templates.bold18CenteredStyle)
                .setHorizontalAlignment(HorizontalAlignment.CENTER))
                .newRow()
                .add(cmp.verticalGap(5));
    }

    private void addDatesSubHeader(String startDate, String endDate, HorizontalListBuilder headerList) {
        if (startDate.equalsIgnoreCase("null") || endDate.equalsIgnoreCase("null")) return;
        String from  = BahmniLocale.getString("FROM");
        String to  = BahmniLocale.getString("TO");
        headerList.add(cmp.text(String.format("%s %s %s %s",from, startDate, to, endDate))
                .setStyle(Templates.bold12CenteredStyle)
                .setHorizontalAlignment(HorizontalAlignment.CENTER))
                .newRow();
    }

    private void addReportGeneratedDateSubHeader(HorizontalListBuilder headerList) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
        String dateString = simpleDateFormat.format(new Date());
        String reportGenerated = BahmniLocale.getString("REPORT_GENERATED_ON");
        headerList.add(cmp.text(reportGenerated + " " + dateString)
                .setStyle(Templates.bold12CenteredStyle)
                .setHorizontalAlignment(HorizontalAlignment.CENTER))
                .newRow();
    }
}
