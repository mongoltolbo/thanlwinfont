<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:axsl="http://www.w3.org/1999/XSL/TransformAlias" 
	xmlns="http://www.w3.org/2000/svg"
	xmlns:svg="http://www.w3.org/2000/svg"
	xmlns:math="http://exslt.org/math">
<xsl:import href="paramDefaults.xslt"/>

<xsl:output method="text"/>

<xsl:param name="paramFile"/>

<xsl:template match="/">
<xsl:value-of select="$version"/>
</xsl:template>

</xsl:stylesheet>

