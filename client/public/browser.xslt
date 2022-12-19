<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Rails Labs</title>
        <meta name="viewport" content="width=device-width,initial-scale=1"/>
        <link href="/assets/bootstrap.css" rel="stylesheet"/>
      </head>

      <body>
        <h1>Гипотеза Симона</h1>
        <table class="table">
          <thead>
            <tr>
              <th>x - 1</th>
              <th>x</th>
              <th>x + 1</th>
              <th>n</th>
              <th>n!</th>
            </tr>
          </thead>
          <tbody>
            <xsl:for-each select="results/result">
              <tr>
                <td>
                  <xsl:value-of select="value - 1"/>
                </td>
                <td>
                  <xsl:value-of select="value"/>
                </td>
                <td>
                  <xsl:value-of select="value + 1"/>
                </td>
                <td>
                  <xsl:value-of select="n_num"/>
                </td>
                <td>
                  <xsl:value-of select="n_fact"/>
                </td>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>