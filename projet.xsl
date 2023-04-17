<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Les enseignants et accompagnateurs</title>
                <link rel="stylesheet" type="text/css" href="projet.css"/>
            </head>
            <body>
                <p>Voici la liste des enseignants:</p>

                <xsl:for-each select="agence/enseignants/enseignant">
                    <xsl:sort select="nom"/>
                    <ul>
                        <li>
                            <b>Nom : </b>
                            <xsl:value-of select="nom"/>
                            <br/>
                            <b>Prénom : </b>
                            <xsl:value-of select="prenom"/>
                            <br/>
                            <b>Mail : </b>
                            <xsl:value-of select="email"/>
                            <br/>
                            <b>Téléphone : </b>
                            <xsl:value-of select="telephone"/>
                            <br/>
                            <b>Spécialité : </b>
                            <xsl:value-of select="specialite"/>
                        </li>
                    </ul>
                </xsl:for-each>

                <p>Voici la liste des accompagnateurs:</p>
                <xsl:for-each select="agence/accompagnateurs/accompagnateur">
                    <xsl:sort select="nom"/>
                    <ul>
                        <li>
                            <b>Nom : </b>
                            <xsl:value-of select="nom"/>
                            <br/>
                            <b>Prénom : </b>
                            <xsl:value-of select="prenom"/>
                            <br/>
                            <b>Mail : </b>
                            <xsl:value-of select="email"/>
                            <br/>
                            <b>Téléphone : </b>
                            <xsl:value-of select="telephone"/>
                        </li>
                    </ul>
                </xsl:for-each>
            </body>
        </html>


    </xsl:template>


</xsl:stylesheet>