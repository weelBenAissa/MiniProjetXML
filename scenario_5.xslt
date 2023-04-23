<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="text" omit-xml-declaration="yes" />
  <xsl:strip-space elements="*" />

  <xsl:template match="/">
    [
      <xsl:apply-templates select="//clients/client"/>
    ]
  </xsl:template>

  <xsl:template match="client">
    {
      "id": <xsl:value-of select="@id" />,
      "prenom": "<xsl:value-of select="@prenom" />",
      "nom": "<xsl:value-of select="@nom" />",
      "age": <xsl:value-of select="@age" />,
      "sexe": "<xsl:value-of select="@sexe" />",
      "adresse": "<xsl:value-of select="@adresse" />",
      "telephone": "<xsl:value-of select="@telephone" />"
    }
    <xsl:if test="position() != last()">,</xsl:if>
  </xsl:template>
  
</xsl:stylesheet>
