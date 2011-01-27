<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math"
	xmlns="http://www.w3.org/2000/svg">

<xsl:include href="param.xslt"/>
<xsl:include href="path.xslt"/>

<xsl:variable name="advance" >
<xsl:choose>
<xsl:when test="$fixedWidth &gt; 0">
<xsl:value-of select="$fixedWidth"/>
</xsl:when>
<xsl:otherwise>
<xsl:value-of select="$wideConsWidth"/>
</xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="overlap" select="0"/>

<xsl:template match="svg:g">
	<xsl:copy use-attribute-sets="gAttribs">
	<xsl:call-template name="u004c"/>
	</xsl:copy>
</xsl:template>

<xsl:template name="u004c">
	<xsl:param name="xOffset" select="0"/>
	<xsl:param name="yOffset" select="0"/>
    <xsl:element name="path" use-attribute-sets="pathAttribs">
    
    <xsl:variable name="arcWidth" >
        <xsl:choose>
        <xsl:when test="$fixedWidth &gt; 0">
        <xsl:value-of select=".5 * $lcWidth - .5 * $thickness"/>
        </xsl:when>
        <xsl:otherwise>
        <xsl:value-of select="2 * $waXOuterRadius - $thickness"/>
        </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:variable name="mAngle" select="math:atan(($latinAscent - $thickness) div ($arcWidth))"/>
    <xsl:variable name="dyTop" select="$thickness div math:cos($mAngle)"/>
    <xsl:variable name="dxBottom" select=".5 * $thickness div math:sin($mAngle)"/>
    <xsl:variable name="dyBottom" select="$dxBottom * math:tan($mAngle)"/>
    <xsl:attribute name="d">
    <xsl:call-template name="Move">
        <xsl:with-param name="x" select="$xOffset + $preGuard"/>
        <xsl:with-param name="y" select="$yOffset + $latinAscent"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="$thickness"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="$arcWidth - .5 * $thickness"/>
        <xsl:with-param name="y" select="-$latinAscent  +$dyBottom"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="$arcWidth - .5 * $thickness"/>
        <xsl:with-param name="y" select="$latinAscent -$dyBottom"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="$thickness"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="0"/>
        <xsl:with-param name="y" select="-$latinAscent"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="-$thickness"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="0"/>
        <xsl:with-param name="y" select="$latinAscent - $dyTop"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="-($arcWidth - .5 * $thickness - $dxBottom)"/>
        <xsl:with-param name="y" select="- $latinAscent + $dyTop"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="-2 * $dxBottom"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="-($arcWidth - .5 * $thickness - $dxBottom)"/>
        <xsl:with-param name="y" select=" $latinAscent - $dyTop"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="0"/>
        <xsl:with-param name="y" select="-$latinAscent + $dyTop"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="-$thickness"/>
        <xsl:with-param name="y" select="0"/>
    </xsl:call-template>
    <xsl:call-template name="line">
    	<xsl:with-param name="x" select="0"/>
        <xsl:with-param name="y" select="$latinAscent"/>
    </xsl:call-template>
    <!--
    -->

	<xsl:call-template name="end"/>

    </xsl:attribute>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>

