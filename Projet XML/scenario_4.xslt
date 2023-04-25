<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <!-- Ajout de la déclaration XML et de la feuille de style -->
  <xsl:output method="xml" version="1.0" encoding="UTF-8"/>
  <xsl:template match="/">
    <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
        <xsl:for-each select="//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/activites">
            <xsl:copy-of select="*"/>
        </xsl:for-each>
    </xs:schema>
  </xsl:template>

</xsl:stylesheet>

