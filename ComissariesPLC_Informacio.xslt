<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/comissaries">
    <html>
      <head> <!-- Introduim el head amb les seves variables meta i link per a l'Estil i Favicon -->
        <title>Comissaries Policia Local de Catalunya</title>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="icon" href="imatges/PLC_Placa.png" type="image/png"/>
        <link rel="stylesheet" href="./style.css"/>
      </head>
      <body>
        <header> <!-- Header on introduim logo de la pàgina -->
          <a class="logo"><img src="imatges/logo.png" alt="logo"/></a>
        </header>
        <div class="contenedor"> <!-- Al contenedor introduim el for-each per a introduir totes les dades del XML -->
          <h2><u>LLISTAT DE COMISSARIES DE POLICIA LOCAL, MUNICIPAL I GUÀRDIA URBANA DE CATALUNYA</u></h2>
          <xsl:for-each select="/comissaries/row">
            <div class="info">
              <h3><u><xsl:value-of select="unitat"/></u></h3>
              <p><strong>Codi d'Informació: </strong><em><xsl:value-of select="codi_d_informaci"/></em></p>
              <p><strong>Direcció: </strong><em><xsl:value-of select="adre_a"/>, <xsl:value-of select="codi_postal"/></em></p>
              <p><strong>Municipi: </strong><em><xsl:value-of select="municipi"/> (<xsl:value-of select="codi_municipi"/>)</em></p>
              <p><strong>Coordenades UTM: </strong><em><xsl:value-of select="utm_x"/>, <xsl:value-of select="utm_y"/></em></p>
              <p><strong>Georeferència: </strong><em><xsl:value-of select="georefer_ncia"/></em></p>
              <hr/>
              <h3>Informació Secundària</h3> <!-- Aquesta info Secundària fa referencia als atributs de cada comissaria -->
              <p><strong>ID: </strong><em><xsl:value-of select="@_id"/></em></p>
              <p><strong>UUID: </strong><em><xsl:value-of select="@_uuid"/></em></p>
              <p><strong>Position: </strong><em><xsl:value-of select="@_position"/></em></p>
              <p><strong>Adress: </strong><em><xsl:value-of select="@_address"/></em></p>            
            </div>
          </xsl:for-each>          
        </div>
        <footer class="foot"> <!-- Finalment tenim un footer on he ficat els links a la pàgina de la base de dades i al 
               meu repositori de GitHub on estàn els arxius XML i XSLT -->
          <div class="footLinks">
            <ul>
              <li><a href="https://analisi.transparenciacatalunya.cat/Seguretat/Comissaries-de-policia-local-de-Catalunya/fdqj-77ib">Bases de Dades Obertes de Catalunya</a></li>
              <br/>
              <li><a href="https://github.com/edsa292/M04_EA2-2_Projecte_XSLT">Repositori Github - edsa292</a></li>
            </ul>
          </div>
          <a class="depInterior"><img src="imatges/interior.png" alt="depInterior"/></a>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>