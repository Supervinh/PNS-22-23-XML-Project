<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:key name="sejourParType" match="sejour" use="@typeSejour"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Résumé des séjours par type</title>
                <link rel="stylesheet" type="text/css" href="scenario2.css"/>
            </head>
            <body>
                <h1>Résumé des séjours par type</h1>
                <table>
                    <tr>
                        <th>Type de séjour</th>
                        <th>Nombre de clients</th>
                    </tr>
                    <xsl:for-each select="agence/sejours/sejour[count(. | key('sejourParType', @typeSejour)[1]) = 1]">
                        <xsl:sort select="@typeSejour"/>
                        <tr>
                            <td>
                                <xsl:value-of select="@typeSejour"/>
                            </td>
                            <td>
                                <xsl:value-of select="count(key('sejourParType', @typeSejour)/clients/client)"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                    <tr>
                        <th>Nombre total de clients</th>
                        <td>
                            <xsl:value-of select="count(agence/sejours/sejour/clients/client)"/>
                        </td>
                    </tr>
                    <tr>
                        <th>Nombre moyen de clients par type de séjour</th>
                        <td>
                            <xsl:value-of select="count(agence/sejours/sejour/clients/client) div count(agence/sejours/sejour[count(. | key('sejourParType', @typeSejour)[1]) = 1])"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
