<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <table>
      <thead>
        <tr>
          <th>X</th>
          <th>X
            <sup>2</sup>
          </th>
        </tr>
      </thead>

      <tbody>
        <xsl:for-each select="objects/object">
          <tr>
            <td>
              <xsl:value-of select="x"/>
            </td>
            <td>
              <xsl:value-of select="xsqr"/>
            </td>
          </tr>
        </xsl:for-each>
        <tr>
          <td>Count:</td>
          <td>
            <xsl:value-of select="count(objects/object)"/>
          </td>
        </tr>
      </tbody>
    </table>
  </xsl:template>
</xsl:stylesheet>
