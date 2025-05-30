// PdfDownloadController.java
package com.exam.exams_application.controllers;

import com.exam.exams_application.dto.Certification;
import com.exam.exams_application.dto.Question;
import com.exam.exams_application.entity.CertificationEntity;
import com.exam.exams_application.service.CertificationServices;
import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.Image;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.*;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.draw.LineSeparator;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.awt.*;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class PdfDownloadController
{
    @Autowired
    private CertificationServices certificationServices;

    @GetMapping("/download-result")
    public void downloadResult(HttpSession session, HttpServletResponse response) throws IOException, DocumentException {
        Certification cert = (Certification) session.getAttribute("cert");


        CertificationEntity certificationEntity=new CertificationEntity();
        BeanUtils.copyProperties(cert,certificationEntity);
        certificationEntity.setExam(cert.getExam().getExamName());

        certificationServices.saveCertificate(certificationEntity);

        if (cert == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        Document document = new Document(PageSize.A4.rotate(), 36, 36, 36, 36);
        PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
        document.open();

        // Enhanced Color Scheme
        Color goldColor = new Color(255, 215, 0);      // Bright Gold
        Color darkGold = new Color(218, 165, 32);      // Dark Gold
        Color royalBlue = new Color(25, 25, 112);      // Royal Blue
        Color elegant = new Color(128, 0, 32);         // Burgundy
        Color accent = new Color(70, 130, 180);        // Steel Blue

        // Enhanced Fonts
        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 48, goldColor);
        Font certifyFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 20, royalBlue);
        Font nameFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 34, elegant);
        Font contentFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, accent);
        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 14, royalBlue);

        // Add Decorative Background
        PdfContentByte canvas = writer.getDirectContentUnder();

        // Add elegant background pattern
        addBackgroundPattern(canvas, document.getPageSize());

        // Add fancy border
        addFancyBorder(canvas, document.getPageSize(), darkGold);

        // Add decorative corners
        addDecorativeCorners(canvas, document.getPageSize(), goldColor);

        // Add Logo with enhanced positioning
        try {
            Image logo = Image.getInstance("src/main/resources/static/logo1.png");
            logo.scaleToFit(150, 150);
            float logoX = (PageSize.A4.rotate().getWidth() - logo.getScaledWidth()) / 2;
            float logoY = PageSize.A4.rotate().getHeight() - 140;
            logo.setAbsolutePosition(logoX, logoY);
            document.add(logo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Title with decorative elements
        Paragraph title = new Paragraph();
        title.setAlignment(Element.ALIGN_CENTER);
        title.setSpacingBefore(100);
        title.add(new Chunk("✯ Certificate of Excellence ✯", titleFont));
        document.add(title);

        // Certify text with styling
        Paragraph certify = new Paragraph();
        certify.setAlignment(Element.ALIGN_CENTER);
        certify.setSpacingBefore(30);
        certify.add(new Chunk("This is to certify that", certifyFont));
        document.add(certify);

        // Name with decorative elements
        String fullName = session.getAttribute("userFirstName") + " " + session.getAttribute("userLastName");
        Paragraph name = new Paragraph();
        name.setAlignment(Element.ALIGN_CENTER);
        name.setSpacingBefore(20);
        name.add(new Chunk("❝ " + fullName + " ❞", nameFont));
        document.add(name);

        // Completion text with enhanced formatting
        Paragraph completion = new Paragraph();
        completion.setAlignment(Element.ALIGN_CENTER);
        completion.setSpacingBefore(20);
        completion.add(new Chunk("has successfully completed the\n\n", certifyFont));
        completion.add(new Chunk("『 " + cert.getExam().getExamName() + " Certification 』\n", contentFont));
        document.add(completion);

        // Score with decorative elements
        double percentage = (double) cert.getScore()/cert.getTotal()*100;
        DecimalFormat df = new DecimalFormat("0.00");
        Paragraph score = new Paragraph();
        score.setAlignment(Element.ALIGN_CENTER);
        score.setSpacingBefore(15);
        score.add(new Chunk("with distinction scoring ", certifyFont));
        score.add(new Chunk("【 " + cert.getScore() + "/" + cert.getTotal() + " (" + df.format(percentage) + "%) 】", contentFont));
        document.add(score);

        // Date and Certificate ID with styling
        SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy");
        Paragraph details = new Paragraph();
        details.setAlignment(Element.ALIGN_CENTER);
        details.setSpacingBefore(20);
        details.add(new Chunk("Issued on: " + dateFormat.format(new Date()) + "\n", normalFont));
        details.add(new Chunk("Certificate ID: " + certificationEntity.getCertId().toString()
                , normalFont));
        document.add(details);

        // Enhanced Signature Section
        PdfPTable signatureTable = new PdfPTable(2);
        signatureTable.setWidthPercentage(80);
        signatureTable.setSpacingBefore(50);

        // Signature cells with decorative elements
        PdfPCell examHeadCell = createSignatureCell("✦ Examination Head ✦", normalFont);
        PdfPCell directorCell = createSignatureCell("✦ Director ✦", normalFont);

        signatureTable.addCell(examHeadCell);
        signatureTable.addCell(directorCell);
        document.add(signatureTable);

        // Add Watermark


        document.close();
    }

    private void addBackgroundPattern(PdfContentByte canvas, Rectangle pageSize) {
        for (float i = 0; i < pageSize.getWidth(); i += 50) {
            for (float j = 0; j < pageSize.getHeight(); j += 50) {
                canvas.setColorFill(new Color(245, 245, 255, 40));
                canvas.circle(i, j, 0.5f);
                canvas.fill();
            }
        }
    }

    private void addFancyBorder(PdfContentByte canvas, Rectangle pageSize, Color borderColor) {
        float margin = 30;

        // Outer border
        canvas.setColorStroke(borderColor);
        canvas.setLineWidth(2);
        canvas.rectangle(margin, margin,
                pageSize.getWidth() - 2 * margin,
                pageSize.getHeight() - 2 * margin);
        canvas.stroke();

        // Inner border
        margin += 5;
        canvas.setLineWidth(1);
        canvas.rectangle(margin, margin,
                pageSize.getWidth() - 2 * margin,
                pageSize.getHeight() - 2 * margin);
        canvas.stroke();
    }

    private void addDecorativeCorners(PdfContentByte canvas, Rectangle pageSize, Color cornerColor) {
        float margin = 30;
        float cornerSize = 20;

        canvas.setColorStroke(cornerColor);
        canvas.setLineWidth(2);

        // Top left corner
        canvas.moveTo(margin, margin + cornerSize);
        canvas.lineTo(margin, margin);
        canvas.lineTo(margin + cornerSize, margin);

        // Top right corner
        canvas.moveTo(pageSize.getWidth() - margin - cornerSize, margin);
        canvas.lineTo(pageSize.getWidth() - margin, margin);
        canvas.lineTo(pageSize.getWidth() - margin, margin + cornerSize);

        // Bottom left corner
        canvas.moveTo(margin, pageSize.getHeight() - margin - cornerSize);
        canvas.lineTo(margin, pageSize.getHeight() - margin);
        canvas.lineTo(margin + cornerSize, pageSize.getHeight() - margin);

        // Bottom right corner
        canvas.moveTo(pageSize.getWidth() - margin - cornerSize, pageSize.getHeight() - margin);
        canvas.lineTo(pageSize.getWidth() - margin, pageSize.getHeight() - margin);
        canvas.lineTo(pageSize.getWidth() - margin, pageSize.getHeight() - margin - cornerSize);

        canvas.stroke();
    }

    private PdfPCell createSignatureCell(String text, Font font) {
        PdfPCell cell = new PdfPCell();
        cell.setBorder(Rectangle.NO_BORDER);

        Paragraph p = new Paragraph();
        p.setAlignment(Element.ALIGN_CENTER);
        p.add(new Chunk("\n\n" + "________________________" + "\n", font));
        p.add(new Chunk(text, font));

        cell.addElement(p);
        return cell;
    }

    private void addWatermark(PdfWriter writer, String text) {
        PdfContentByte canvas = writer.getDirectContentUnder();
        canvas.saveState();
        canvas.setColorFill(new Color(211, 211, 211, 30));
        try {
            canvas.beginText();
            BaseFont font = BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.WINANSI, BaseFont.EMBEDDED);
            canvas.setFontAndSize(font, 60);
            canvas.showTextAligned(Element.ALIGN_CENTER, text,
                    PageSize.A4.rotate().getWidth()/2,
                    PageSize.A4.rotate().getHeight()/2, 45);
            canvas.endText();
        } catch (Exception e) {
            e.printStackTrace();
        }
        canvas.restoreState();
    }
}
//@Controller
//public class PdfDownloadController
//{
//    @Autowired
//    private CertificationServices certificationServices;
//
//    @GetMapping("/download-result")
//    public void downloadResult(HttpSession session, HttpServletResponse response) throws IOException {
//        Certification cert = (Certification) session.getAttribute("cert");
//        CertificationEntity certificationEntity=new CertificationEntity();
//        BeanUtils.copyProperties(cert,certificationEntity);
//        certificationEntity.setExam(cert.getExam().getExamName());
//
//        certificationServices.saveCertificate(certificationEntity);
//
//        double percentage=(double) cert.getScore()/cert.getTotal()*100;
//
//        if (cert == null)
//        {
//            response.sendError(HttpServletResponse.SC_NOT_FOUND, "No certification result found in session.");
//            return;
//        }
//
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "attachment; filename="+cert.getExam().getExamName()+"certificate.pdf");
//
//        Document document = new Document(PageSize.A4);
//        PdfWriter.getInstance(document, response.getOutputStream());
//        document.open();
//
//        // Fonts
//        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, Color.WHITE);
//        Font subTitleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18, Color.DARK_GRAY);
//        Font normalFont = FontFactory.getFont(FontFactory.HELVETICA, 12, Color.BLACK);
//        Font labelFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14, Color.BLUE);
//        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
//
//        // ================== 1. Add Logo ==================
//        try {
//            String logoPath = "src/main/resources/static/logo.png";
//            Image logo = Image.getInstance(logoPath);
//            logo.scaleToFit(100, 60);
//            logo.setAlignment(Image.ALIGN_CENTER);
//            document.add(logo);
//        } catch (Exception e) {
//            System.out.println("Logo not found.");
//        }
//
//        // ================== 2. Header - CJSS Technology ==================
//        PdfPTable headerTable = new PdfPTable(1);
//        headerTable.setWidthPercentage(100);
//        PdfPCell headerCell = new PdfPCell(new Phrase("CJSS TECHNOLOGY", titleFont));
//        headerCell.setBackgroundColor(new Color(0, 121, 184));
//        headerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
//        headerCell.setBorder(Rectangle.NO_BORDER);
//        headerCell.setPadding(12f);
//        headerTable.addCell(headerCell);
//        document.add(headerTable);
//
//        document.add(Chunk.NEWLINE);
//
//        // ================== 3. Certificate Body ==================
//        PdfPTable certTable = new PdfPTable(2);
//        certTable.setWidthPercentage(90);
//        certTable.setSpacingBefore(20f);
//        certTable.setSpacingAfter(20f);
//        certTable.setWidths(new int[]{2, 4});
//
//        // Add bordered background table for better styling
//        certTable.addCell(getCell("Certificate ID:", labelFont));
//        certTable.addCell(getCell(certificationEntity.getCertId().toString(), normalFont));
//
//        certTable.addCell(getCell("User ID:", labelFont));
//        certTable.addCell(getCell((String) session.getAttribute("userEmail"), normalFont));
//
//        certTable.addCell(getCell("User First Name:", labelFont));
//        certTable.addCell(getCell((String) session.getAttribute("userFirstName"), normalFont));
//
//        certTable.addCell(getCell("User Last Name:", labelFont));
//        certTable.addCell(getCell((String) session.getAttribute("userLastName"), normalFont));
//
//        certTable.addCell(getCell("Exam Name:", labelFont));
//        certTable.addCell(getCell(cert.getExam().getExamName(), normalFont));
//
//        certTable.addCell(getCell("Score:", labelFont));
//        certTable.addCell(getCell(cert.getScore() + " / " + cert.getTotal(), normalFont));
//
//        DecimalFormat df = new DecimalFormat("0.00");
//        certTable.addCell(getCell("Percentage %:", labelFont));
//        certTable.addCell(getCell(df.format(percentage) + " %", normalFont));
//
//        certTable.addCell(getCell("Start Time:", labelFont));
//        certTable.addCell(getCell(sdf.format(cert.getStart()), normalFont));
//
//        certTable.addCell(getCell("End Time:", labelFont));
//        certTable.addCell(getCell(sdf.format(cert.getEnd()), normalFont));
//
//        document.add(certTable);
//
//        // ================== 4. Footer ==================
//        Paragraph footer = new Paragraph("Thank you for taking the certification with CJSS TECHNOLOGY.", subTitleFont);
//        footer.setAlignment(Element.ALIGN_CENTER);
//        document.add(footer);
//
//        document.close();
//    }
//
//    // Helper method for styled cell
//    private PdfPCell getCell(String text, Font font) {
//        PdfPCell cell = new PdfPCell(new Phrase(text, font));
//        cell.setPadding(8f);
//        cell.setBorderColor(Color.LIGHT_GRAY);
//        return cell;
//    }
//
//
//}
