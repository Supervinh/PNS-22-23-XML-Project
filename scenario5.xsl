<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>

<!--    <xsl:template match="/">
        <json:object>
            <xsl:apply-templates/>
        </json:object>
    </xsl:template>

    <xsl:template match="*">
        <json:string name="{local-name()}">
            <xsl:apply-templates/>
        </json:string>
    </xsl:template>

    <xsl:template match="text()">
        <json:string><xsl:value-of select="."/></json:string>
    </xsl:template>-->


    <xsl:template match="/">
        <xsl:text>{</xsl:text>
        <xsl:apply-templates select="*" mode="object"/>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <xsl:template match="*" mode="object">
        <xsl:if test="position() > 1"><xsl:text>,</xsl:text></xsl:if>
        <xsl:text>"</xsl:text><xsl:value-of select="name()"/><xsl:text>":</xsl:text>
        <xsl:choose>
            <xsl:when test="count(*) > 0">
                <xsl:text>{</xsl:text>
                <xsl:apply-templates select="*" mode="object"/>
                <xsl:text>}</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>"</xsl:text><xsl:value-of select="normalize-space(.)"/><xsl:text>"</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>



</xsl:stylesheet>