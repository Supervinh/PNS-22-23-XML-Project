<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xdt="http://exslt.org/dates-and-times"
                exclude-result-prefixes="xdt">

    <xsl:variable name="dateDebut" select="xdt:format-date(//dateDebut,'2023-05-30 00:00:00')"/>
    <xsl:variable name="dateFin" select="xdt:format-date(//dateFin,'2023-06-30 00:00:00')"/>

    <xsl:template match="/">
        <agence>
            <xsl:attribute name="nom">
                <xsl:value-of select="/agence/@nom"/>
            </xsl:attribute>
            <sejours>
                <xsl:apply-templates select="/agence/sejours/sejour[
          dateDebut &gt;= $dateDebut and dateFin &lt;= $dateFin
        ]"/>
            </sejours>
        </agence>
    </xsl:template>

    <xsl:template match="sejour">
        <sejour>
            <xsl:attribute name="typeSejour">
                <xsl:value-of select="@typeSejour"/>
            </xsl:attribute>
            <xsl:attribute name="typePublic">
                <xsl:value-of select="@typePublic"/>
            </xsl:attribute>
            <offre>
                <nomOffre>
                    <xsl:value-of select="offre/nomOffre"/>
                </nomOffre>
                <description>
                    <xsl:value-of select="offre/description"/>
                </description>
                <destination>
                    <xsl:value-of select="offre/destination"/>
                </destination>
            </offre>
            <prix>
                <xsl:value-of select="prix"/>
            </prix>
            <dateDebut>
                <xsl:value-of select="dateDebut"/>
            </dateDebut>
            <dateFin>
                <xsl:value-of select="dateFin"/>
            </dateFin>
        </sejour>
    </xsl:template>

</xsl:stylesheet>