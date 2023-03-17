package com.hackerthon.common;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import java.io.File;
import java.io.IOException;

public class UtilQ extends UtilC {

    private static UtilQ instance = null;
    private static Document doc;

    private UtilQ() throws ParserConfigurationException, SAXException, IOException {
        File file = new File("src/com/hackerthon/config/EmployeeQuery.xml");
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        UtilQ.doc = db.parse(file);
    }

    public static synchronized UtilQ getInstance() throws ParserConfigurationException, SAXException, IOException {
        if (instance == null) {
            instance = new UtilQ();
        }
        return instance;
    }

    public static String Q(String id) throws Exception {
        NodeList nodeList = doc.getElementsByTagName("query");
        Element element = null;
        for (int i = 0; i < nodeList.getLength(); i++) {
            element = (Element) nodeList.item(i);
            if (element.getAttribute("id").equals(id)) {
                break;
            }
        }
        return element.getTextContent().trim();
    }
}
