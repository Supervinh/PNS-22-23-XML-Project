<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0">

    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="agence">
        <xsl:text>{</xsl:text>
        <xsl:text>"</xsl:text><xsl:value-of select="name()"/><xsl:text>":</xsl:text>
        <xsl:apply-templates select="sejours"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="sejours">
        <xsl:text>{</xsl:text>
        <xsl:text>"</xsl:text><xsl:value-of select="name()"/><xsl:text>": [</xsl:text>
        <xsl:apply-templates select="sejour" mode="object"/>
        <xsl:text>]</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="*" mode="object">
        <xsl:if test="position() > 1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:if test="name() != 'sejour' and name()!='client' and name()!='enseignant' and name()!='accompagnateur'">
            <xsl:text>"</xsl:text><xsl:value-of select="name()"/><xsl:text>":</xsl:text>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="'sejour' = name() and count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates select="dateDebut" mode="object"/>
                <xsl:text>,</xsl:text>
                <xsl:apply-templates select="dateFin" mode="object"/>
                <xsl:text>,</xsl:text>
                <xsl:apply-templates select="clients" mode="object"/>
                <xsl:text>,</xsl:text>
                <xsl:apply-templates select="offre/activites" mode="object"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="'activites' = name() and count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates select="*/*[name() != 'testLinguistique']" mode="object"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="'activite_sportive' = name() and count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:call-template name="accompagnateurs">
                    <xsl:with-param name="accompagnateurs" select="encadrement_sportif"/>
                </xsl:call-template>

                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="'activite_culturelle' = name() and count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:call-template name="accompagnateurs">
                    <xsl:with-param name="accompagnateurs" select="encadrement_culturel"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="'cours' = name() and count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates select="enseignants"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:when test="'clients' = name() and count(*) > 0 ">
                <xsl:apply-templates select="."/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="clients">
        <xsl:if test="position() > 1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>[</xsl:text>
        <xsl:apply-templates select="*" mode="object"/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template match = "enseignants">
        <xsl:if test="position() > 1">
            <xsl:text>,</xsl:text>
        </xsl:if>
        <xsl:text>"enseignants": [</xsl:text>
        <xsl:apply-templates select="enseignant" mode="object"/>
        <xsl:text>]</xsl:text>
    </xsl:template>

    <xsl:template name="accompagnateurs">
        <xsl:param name="accompagnateurs"/>
        <xsl:text>"accompagnateurs": [</xsl:text>
        <xsl:apply-templates select="$accompagnateurs/accompagnateur" mode="object"/>
        <xsl:text>]</xsl:text>
    </xsl:template>



</xsl:stylesheet>