<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!-- Group clients by type of stay -->
    <xsl:key name="clients-by-stay-type" match="//sejour" use="@typeSejour" />

    <!-- Template for root node -->
    <xsl:template match="/">
        <resultats>
            <!-- Apply template for each unique type of stay -->
            <xsl:for-each select="//sejour[generate-id() = generate-id(key('clients-by-stay-type', @typeSejour)[1])]">
                <sejour typeSejour="{@typeSejour}">
                    <ageMoyen>
                        <!-- Calculate the average age of clients for this type of stay -->
                        <xsl:call-template name="calculate-average-age">
                            <xsl:with-param name="clients" select="key('clients-by-stay-type', @typeSejour)/clients/client" />
                        </xsl:call-template>
                    </ageMoyen>
                </sejour>
            </xsl:for-each>
        </resultats>
    </xsl:template>

    <!-- Template for calculating the average age of clients -->
    <xsl:template name="calculate-average-age">
        <xsl:param name="clients" />
        <xsl:variable name="totalAge">
            <!-- Sum the age of all clients for this type of stay -->
            <xsl:for-each select="$clients">
                <xsl:value-of select="years-from-duration(current-date() - xs:date(/client[@idref = current()/@idref]/@dateNaissance))" />
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="numClients" select="count($clients)" />
        <!-- Calculate the average age and round to two decimal places -->
        <xsl:value-of select="format-number($totalAge div $numClients, '#.##')" />
    </xsl:template>


</xsl:stylesheet>
