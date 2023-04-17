<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Prix total de tous les séjours</title>
                <link rel="stylesheet" type="text/css" href="scenario3.css"/>
            </head>
            <body>
                <p>Voici les activités proposées pour chaque offre de chaque séjour:</p>
                <xsl:for-each select="agence/sejours/sejour">
                    Séjour numéro
                    <xsl:value-of select="position()"/> :
                    <xsl:for-each select="offre">
                        <br/>
                        <b>Nom de l'offre :</b>
                        <xsl:value-of select="nomOffre"/>
                        <br/>
                        <xsl:call-template name="afficherActivites">
                            <xsl:with-param name="activites" select="activites"/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:for-each>

            </body>
        </html>
    </xsl:template>

    <xsl:template name="afficherActivites">
        <xsl:param name="activites"/>
        <xsl:choose>
            <xsl:when test="$activites">
                <xsl:variable name="activite" select="$activites[1]"/>
                <xsl:for-each select="$activite/*">
                    <ul>
                        <li>
                            <b>Type de l'activité : </b>
                            <xsl:value-of select="name(*)"/>
                            <br/>

                            <b>Nom :</b>
                            <xsl:value-of select="*/nom"/>
                            <br/>

                            <b>Description :</b>
                            <xsl:value-of select="*/description"/>
                            <br/>
                        </li>
                    </ul>
                </xsl:for-each>
                <xsl:call-template name="afficherActivites">
                    <xsl:with-param name="activites" select="$activites[position() > 1]"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text> </xsl:text>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>