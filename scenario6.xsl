<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="xs">

    <!-- Define variables for reusable values -->
    <xsl:variable name="newline">
        <xsl:text>
        </xsl:text>
    </xsl:variable>
    <xsl:variable name="tab">
        <xsl:text>    </xsl:text>
    </xsl:variable>

    <!-- Match the root element and output the new XML structure -->
    <xsl:template match="/">
        <agence nom="Agence de voyages">
            <sejours>
                <!-- Transform each sejour element -->
                <xsl:apply-templates select="//sejour"/>
            </sejours>
            <accompagnateurs>
                <!-- Transform each accompagnateur element -->
                <xsl:apply-templates select="//accompagnateur"/>
            </accompagnateurs>
            <enseignants>
                <!-- TODO: transform enseignantsType elements -->
            </enseignants>
            <clients>
                <!-- Transform each client element -->
                <xsl:apply-templates select="//client"/>
            </clients>
        </agence>
    </xsl:template>

    <!-- Transform each sejour element -->
    <xsl:template match="sejour">
        <sejour typeSejour="{@typeSejour}" typePublic="{@typePublic}">
            <xsl:apply-templates select="offre"/>
            <prix><xsl:value-of select="prix"/></prix>
            <dateDebut><xsl:value-of select="dateDebut"/></dateDebut>
            <dateFin><xsl:value-of select="dateFin"/></dateFin>
            <clients>
                <xsl:apply-templates select="clients/client"/>
            </clients>
        </sejour>
    </xsl:template>

    <!-- Transform each offre element -->
    <xsl:template match="offre">
        <offre>
            <nomOffre><xsl:value-of select="nomOffre"/></nomOffre>
            <description><xsl:value-of select="description"/></description>
            <langues>
                <xsl:apply-templates select="langues/langue"/>
            </langues>
            <destination><xsl:value-of select="destination"/></destination>
            <activites>
                <xsl:apply-templates select="activites/activite"/>
            </activites>
        </offre>
    </xsl:template>

    <!-- Transform each langue element -->
    <xsl:template match="langue">
        <langue><xsl:value-of select="."/></langue>
    </xsl:template>

    <!-- Transform each activite element -->
    <xsl:template match="activite">
        <activite><xsl:value-of select="."/></activite>
    </xsl:template>

    <!-- Transform each accompagnateur element -->
    <xsl:template match="accompagnateur">
        <accompagnateur>
            <nom><xsl:value-of select="nom"/></nom>
            <prenom><xsl:value-of select="prenom"/></prenom>
            <adresse><xsl:value-of select="adresse"/></adresse>
            <!-- TODO: add other fields -->
        </accompagnateur>
</xsl:template>

        <!-- Template for the clients element -->
<xsl:template match="clients">
<clients>
    <xsl:for-each select="client">
        <client>
            <nom>
                <xsl:value-of select="nom"/>
            </nom>
            <prenom>
                <xsl:value-of select="prenom"/>
            </prenom>
            <dateNaissance>
                <xsl:value-of select="dateNaissance"/>
            </dateNaissance>
            <adresse>
                <xsl:value-of select="adresse"/>
            </adresse>
            <telephone>
                <xsl:value-of select="telephone"/>
            </telephone>
            <email>
                <xsl:value-of select="email"/>
            </email>
        </client>
    </xsl:for-each>
</clients>
</xsl:template>

        <!-- Template for the enseignants element -->
<xsl:template match="enseignants">
<enseignants>
    <xsl:for-each select="enseignant">
        <enseignant>
            <nom>
                <xsl:value-of select="nom"/>
            </nom>
            <prenom>
                <xsl:value-of select="prenom"/>
            </prenom>
            <adresse>
                <xsl:value-of select="adresse"/>
            </adresse>
            <telephone>
                <xsl:value-of select="telephone"/>
            </telephone>
            <email>
                <xsl:value-of select="email"/>
            </email>
            <matiere>
                <xsl:value-of select="matiere"/>
            </matiere>
        </enseignant>
    </xsl:for-each>
</enseignants>
</xsl:template>

        </xsl:stylesheet>

