<?xml version='1.0' encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xml:lang="en"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:local="http://www.w3.org/2005/xquery-local-functions"
                xmlns:xs="http://www.w3.org/2001/XMLSchema">


    <xsl:output method="xml" omit-xml-declaration="no" indent="yes" encoding="UTF-8"/>
    <xsl:comment select="'this is a comment'" />

    <xsl:variable name="var1" select="'var1'"/>
    <xsl:variable name="var2" select="concat('two', $var1) "/>
    
    <out attr="{var1}" />

    <xsl:template name="one">
	  <xsl:param name="p1" select="'def1'"/>
	  <xsl:param name="p2" select="'def2'"/>
            <xsl:choose/>
      <style name="XSLT" description="XSLT mode" namespace="http://www.w3.org/1999/XSL/Transform"/>
    </xsl:template>

    <xsl:template match="/">
    
        <xsl:variable name="var3" select="'var3'"/>

        <template name="x">
        </template>

	  <xsl:if test="/">
		<in-if />
		<xsl:attribute name="attr">
		  <xsl:value-of select="'xxx'"/>
		</xsl:attribute>
	  </xsl:if>
	  
	  <xsl:choose>
                <xsl:when test="position()=1">
		  <one/>
		</xsl:when>
                <xsl:when test="position()=2">
		  <two/>
		</xsl:when>
		<xsl:otherwise>
		  <other/>
		</xsl:otherwise>
	  </xsl:choose>

	  <xsl:call-template name="one">
		<xsl:with-param name="p1" select="$var1"/>
		<xsl:with-param name="p2" select="$var3"/>
	  </xsl:call-template>

            <xsl:apply-templates select="*"/>
	</xsl:template>

</xsl:stylesheet>
