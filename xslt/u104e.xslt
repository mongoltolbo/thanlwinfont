<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math">

<xsl:include href="param.xslt"/>
<xsl:include href="path.xslt"/>

<xsl:variable name="advance" select="$narrowConsWidth"/>
<xsl:variable name="overlap" select="0"/>

<xsl:variable name="cutOuterDx" select="math:cos($myCutAngle) * $waYOuterRadius"/>
<xsl:variable name="cutOuterDy" select="math:sin($myCutAngle) * $waYOuterRadius"/>
<xsl:variable name="cutInnerDx" select="math:cos($myCutAngle) * $waYInnerRadius"/>
<xsl:variable name="cutInnerDy" select="math:sin($myCutAngle) * $waYInnerRadius"/>


<xsl:variable name="hookOuterDx" select="math:cos($hookStartAngle) * $waYOuterRadius"/>
<xsl:variable name="hookOuterDy" select="math:sin($hookStartAngle) * $waYOuterRadius"/>
<xsl:variable name="hookInnerDx" select="math:cos($hookStartAngle) * $waYInnerRadius"/>
<xsl:variable name="hookInnerDy" select="math:sin($hookStartAngle) * $waYInnerRadius"/>

<xsl:template match="svg:g">
	<xsl:copy use-attribute-sets="gAttribs">
	<xsl:call-template name="u104e"/>
	</xsl:copy>
</xsl:template>

<xsl:template name="u104e">
	<xsl:param name="xOffset" select="0"/>
	<xsl:message terminate="no"><xsl:value-of select="$cutOuterDy"/></xsl:message>
    <xsl:element name="path" use-attribute-sets="pathAttribs">
    <xsl:attribute name="d">
    <xsl:call-template name="Move">
        <xsl:with-param name="x" select="$xOffset + $preGuard+$waXOuterRadius + $cutOuterDx"/>
        <xsl:with-param name="y" select="$cutOuterDy + $waYOuterRadius"/>
    </xsl:call-template>
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$waXOuterRadius"/>
        <xsl:with-param name="ry" select="$waYOuterRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="1"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select="-$cutOuterDx + $hookOuterDx"/>
        <xsl:with-param name="y" select="- $cutOuterDy - $hookOuterDy"/>
    </xsl:call-template>
    
        <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$hookInnerRadius"/>
        <xsl:with-param name="ry" select="$hookInnerRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="0"/>
        <xsl:with-param name="x" select="$hookInnerRadius * (1 + math:cos($hookStartAngle))"/>
        <xsl:with-param name="y" select="- $hookInnerRadius * math:sin($hookStartAngle)"/>
    </xsl:call-template>
    
    <xsl:text>l0,</xsl:text>
    <xsl:value-of select="-$descent - $waYOuterRadius + $hookOuterDy + $hookInnerRadius * math:sin($hookStartAngle)"/>
    <xsl:text>l</xsl:text><xsl:value-of select="$thickness"/><xsl:text>,0</xsl:text>
    <xsl:text>l0,</xsl:text>
    <xsl:value-of select="$descent + $waYOuterRadius - $hookOuterDy - $hookInnerRadius * math:sin($hookStartAngle)"/>
    
	
    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$hookOuterRadius"/>
        <xsl:with-param name="ry" select="$hookOuterRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="0"/>
        <xsl:with-param name="clockwise" select="1"/>
        <xsl:with-param name="x" select="-$hookOuterRadius * (1 + math:cos($hookStartAngle))"/>
        <xsl:with-param name="y" select="$hookOuterRadius * math:sin($hookStartAngle)"/>
    </xsl:call-template>

    <xsl:call-template name="arc">
        <xsl:with-param name="rx" select="$waXInnerRadius"/>
        <xsl:with-param name="ry" select="$waYInnerRadius"/>
        <xsl:with-param name="axisRotation" select="0"/>
        <xsl:with-param name="large" select="1"/>
        <xsl:with-param name="clockwise" select="0"/>
        <xsl:with-param name="x" select="-$hookInnerDx + $cutInnerDx"/>
        <xsl:with-param name="y" select="$cutInnerDy + $hookInnerDy"/>
    </xsl:call-template>
    <xsl:call-template name="inner2outer">
    	<xsl:with-param name="cx" select="- $cutOuterDx"/>
    	<xsl:with-param name="cy" select="- $cutOuterDy"/>
    </xsl:call-template>
    <xsl:call-template name="end"/>
    </xsl:attribute>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>

