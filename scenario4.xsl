<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="dateDebut">2020-05-30</xsl:variable>
    <xsl:variable name="dateFin">2024-06-30</xsl:variable>
    <xsl:variable name="langue">italien</xsl:variable>

    <xsl:template match="/">
        <agence>
            <xsl:attribute name="nom">
                <xsl:value-of select="/agence/@nom"/>
            </xsl:attribute>
            <sejours>
                <xsl:apply-templates select="/agence/sejours/sejour[
                    translate(dateDebut, '-', '') &gt;= translate($dateDebut, '-', '') and
                    translate(dateFin, '-', '') &lt;= translate($dateFin, '-', '') and
                    offre/langues/langue = $langue
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