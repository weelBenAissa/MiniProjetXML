<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/">
    <html>
      <head>
        <title>Offres de séjours linguistiques</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
        <link rel="stylesheet" href="style.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
        <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&amp;family=Montserrat:ital,wght@0,200;1,200&amp;display=swap" rel="stylesheet"/>
      </head>
      <body>
        <h1>Liste des offres de séjours linguistiques</h1>
        <table>
          <tr>
            <th>Destination</th>
            <th>Cours de langue</th>
            <th>Test de langue</th>
            <th>Activités culturelles</th>
            <th>Prix</th>
            <th>Date</th>
          </tr>
          <xsl:for-each select="centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique">
            <tr>
              <td><xsl:value-of select="destination"/></td>
              <td><xsl:value-of select="cours_de_langue"/></td>
              <td>
                <ul>
                  <xsl:for-each select="activites/activite">
                    <li><xsl:value-of select="culturelle"/></li>
                  </xsl:for-each>
                </ul>
              </td>
              <td><xsl:value-of select="prix"/> €</td>
              <td><xsl:value-of select="date"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
