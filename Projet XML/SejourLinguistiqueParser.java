import java.io.File;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

public class SejourLinguistiqueParser {

    public static void main(String[] args) {

        try {
            File inputFile = new File("sejours_document.xml");

            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(inputFile);
            doc.getDocumentElement().normalize();

            NodeList sejoursLinguistiques = doc.getElementsByTagName("sejour_linguistique");

            for (int i = 0; i < sejoursLinguistiques.getLength(); i++) {
                Node sejourLinguistiqueNode = sejoursLinguistiques.item(i);
                if (sejourLinguistiqueNode.getNodeType() == Node.ELEMENT_NODE) {
                    Element sejourLinguistiqueElement = (Element) sejourLinguistiqueNode;

                    String id = sejourLinguistiqueElement.getElementsByTagName("id").item(0).getTextContent();
                    String destination = sejourLinguistiqueElement.getElementsByTagName("destination").item(0).getTextContent();
                    System.out.println();
                    System.out.println("\u001B[36m" + " Séjour linguistique " + id + " à " + "\u001B[31m" +  destination + "\u001B[0m");

                    NodeList clients = sejourLinguistiqueElement.getElementsByTagName("client");

                    NodeList activites = sejourLinguistiqueElement.getElementsByTagName("activite");
                    for (int j = 0; j < activites.getLength(); j++) {
                        Node activiteNode = activites.item(j);
                        if (activiteNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element activiteElement = (Element) activiteNode;
                            System.out.println("\u001B[32m" + "  ->" + " Activité : " + "\u001B[0m" + j + activiteElement.getTextContent());
                        }
                    }

                    System.out.println("  -------------------------------------------------  ");

                    for (int j = 0; j < clients.getLength(); j++) {
                        Node clientNode = clients.item(j);
                        if (clientNode.getNodeType() == Node.ELEMENT_NODE) {
                            Element clientElement = (Element) clientNode;

                            String prenom = clientElement.getAttribute("prenom");
                            String nom = clientElement.getAttribute("nom");
                            System.out.println();
                            System.out.println("\u001B[33m" + "  ->" + " Client : " + "\u001B[0m" + prenom + " " + nom);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
