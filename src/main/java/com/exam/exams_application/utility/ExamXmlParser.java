// ExamXmlParser.java
package com.exam.exams_application.utility;

import com.exam.exams_application.dto.Exam;
import com.exam.exams_application.dto.Question;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

public class ExamXmlParser {

    public static Exam parseExamXml(String xmlPath) {
        try {
            File file = new File(xmlPath);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(file);
            doc.getDocumentElement().normalize();

            NodeList qNodes = doc.getElementsByTagName("question");
            List<Question> questions = new ArrayList<>();

            for (int i = 0; i < qNodes.getLength(); i++) {
                Element qElement = (Element) qNodes.item(i);
                Question q = new Question();
                q.setSno(i);
                q.setqText(qElement.getElementsByTagName("qtext").item(0).getTextContent().trim());

                Map<String, String> options = new LinkedHashMap<>();
                NodeList choiceList = qElement.getElementsByTagName("choice");
                for (int j = 0; j < choiceList.getLength(); j++) {
                    Element choice = (Element) choiceList.item(j);
                    String id = choice.getAttribute("id").trim();
                    options.put(id, choice.getTextContent().trim());
                }
                q.setOptions(options);

                String answerText = qElement.getElementsByTagName("answer").item(0).getTextContent().trim();
                Set<String> correctAnswers = Arrays.stream(answerText.split(","))
                        .map(String::trim)
                        .collect(Collectors.toSet());
                q.setCorrectAnswers(correctAnswers);

                questions.add(q);
            }

            Exam exam = new Exam();
            exam.setQuestion(questions);
            return exam;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
