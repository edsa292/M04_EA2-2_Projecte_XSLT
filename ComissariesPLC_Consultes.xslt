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
                <header> <!-- Header on introduim títol de la pàgina -->
                    <a class="logo"><img src="imatges/logo.png" alt="logo"/></a>
                </header>
                <div class="contenedor">
                    <h2><u>TAULAES INFORMATIVES PER PEROVINCIES</u></h2>
                    <p>A continuació podreu accedir a les dades de les comissaries de Policia Local, Municipal i Guàrida Urbana ordenades 
                        alfabeticament pel seu municipi i dividides per les quatre provincies de Catalunya. Selecciona una per accedir a 
                        les dades: </p>
                    <button><a href="#TGN">Tarragona</a></button>
                    <button><a href="#BCN">Barcelona</a></button>
                    <button><a href="#LDA">Lleida</a></button>
                    <button><a href="#GIR">Girona</a></button>
                    
                </div>
                <div class="contenedor"> 
                    <a id="TGN"></a>
                    <h2><u>TAULA COMISSARIES DE LA PROVINCIA DE TARRAGONA</u></h2>
                    <!-- Taula de totes les comissaries que formen part de la provincia de Tarragona -->
                    <br></br>
                    <div class="contenedor-tabla">
                        <table border="1">
                            <!-- Total de columnes de la taula -->
                            <tr>
                                <th style="text-align:center">Unitat</th>
                                <th style="text-align:center">Codi Info</th>
                                <th style="text-align:center">Adreça</th>
                                <th style="text-align:center">Codi Postal</th>
                                <th style="text-align:center">Municipi</th>
                                <th style="text-align:center">Codi Municipi</th>
                                <th style="text-align:center">UTM X / Y</th>
                                <th style="text-align:center">Georeferència</th>
                            </tr>
                            <!-- For-each : per a crear un blucle i reproduir la informació de les dades del XML-->
                            <xsl:for-each select="/comissaries/row">
                                <!-- Sort : introduïm aquesta consulta per a ordenar la taula de manera alfabètica mitjançant el nom del municipi
                                     d'aquesta manera serà mes fàcil una comissaria-->
                                <xsl:sort select="municipi"/>
                                <!-- If : introduïm aquesta consulta per mostrar en la taula totes les comissaries que siguin de tarragona:
                                     "si el codi postal comença per 43, mostra-ho" -->
                                <xsl:if test="starts-with(codi_postal, '43')">
                                    <tr>
                                        <!-- Choose - When : introduïm aquesta consulta per cambiar de color la cel·la de totes aquelles comissaries
                                             que siguin denominades "Guàrdia Urbana" -->
                                        <xsl:choose>
                                            <xsl:when test="starts-with(unitat, 'Guàrdia')">
                                                <!-- En cas de que trobi una comissaria de "Guàrdia Urbana" Pintara la cel·la de color blau clar -->
                                                <td style="background-color:LightSteelBlue">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong>
                                                </td>
                                            </xsl:when>
                                            <!-- Otherwise : introduïm aquesta consulta per a reproduir les altres comissaries que no siguin "Guàrdia 
                                                 Urbana" -->
                                            <xsl:otherwise>
                                                <td style="background-color:#cfdce2">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong>
                                                </td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <td><xsl:value-of select="codi_d_informaci"/></td>
                                        <td><xsl:value-of select="adre_a"/></td>
                                        <td><xsl:value-of select="codi_postal"/></td>
                                        <td><xsl:value-of select="municipi"/></td>
                                        <td><xsl:value-of select="codi_municipi"/></td>
                                        <td><xsl:value-of select="utm_x"/>, <xsl:value-of select="utm_y"/></td>
                                        <td><xsl:value-of select="georefer_ncia"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <!-- Fem el mateix procès per a les altres taules de BARCELONA, GIRONA i LLEIDA -->
                <div class="contenedor">
                    <a id="BCN"></a>
                    <h2><u>TAULA COMISSARIES DE LA PROVINCIA DE BARCELONA</u></h2>
                    <!-- Taula de totes les comissaries que formen part de la provincia de Barcelona -->
                    <div class="contenedor-tabla">
                        <table border="1">
                            <tr bgcolor="#B1FFF0">
                                <th style="text-align:center">Unitat</th>
                                <th style="text-align:center">Codi Info</th>
                                <th style="text-align:center">Adreça</th>
                                <th style="text-align:center">Codi Postal</th>
                                <th style="text-align:center">Municipi</th>
                                <th style="text-align:center">Codi Municipi</th>
                                <th style="text-align:center">UTM X / Y</th>
                                <th style="text-align:center">Georeferencia</th>
                            </tr>
                            <xsl:for-each select="/comissaries/row">
                                <xsl:sort select="municipi"/>
                                <xsl:if test="starts-with(codi_postal, '08')">
                                    <tr>
                                        <xsl:choose>
                                            <xsl:when test="starts-with(unitat, 'Guàrdia')">
                                                <td style="background-color:LightSteelBlue">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td style="background-color:#cfdce2">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong></td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <td><xsl:value-of select="codi_d_informaci"/></td>
                                        <td><xsl:value-of select="adre_a"/></td>
                                        <td><xsl:value-of select="codi_postal"/></td>
                                        <td><xsl:value-of select="municipi"/></td>
                                        <td><xsl:value-of select="codi_municipi"/></td>
                                        <td><xsl:value-of select="utm_x"/>, <xsl:value-of select="utm_y"/></td>
                                        <td><xsl:value-of select="georefer_ncia"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                        <br/>
                        
                    </div>
                </div>
                <div class="contenedor">
                    <a id="LDA"></a>
                    <h2><u>TAULA COMISSARIES DE LA PROVINCIA DE LLEIDA</u></h2>
                    <!-- Taula de totes les comissaries que formen part de la provincia de Lleida -->
                    <div class="contenedor-tabla">
                        <table border="1">
                            <tr bgcolor="#B1FFF0">
                                <th style="text-align:center">Unitat</th>
                                <th style="text-align:center">Codi Info</th>
                                <th style="text-align:center">Adreça</th>
                                <th style="text-align:center">Codi Postal</th>
                                <th style="text-align:center">Municipi</th>
                                <th style="text-align:center">Codi Municipi</th>
                                <th style="text-align:center">UTM X / Y</th>
                                <th style="text-align:center">Georeferència</th>
                            </tr>
                            <xsl:for-each select="/comissaries/row">
                                <xsl:sort select="municipi"/>
                                <xsl:if test="starts-with(codi_postal, '25')">
                                    <tr>
                                        <xsl:choose>
                                            <xsl:when test="starts-with(unitat, 'Guàrdia')">
                                                <td style="background-color:LightSteelBlue">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td style="background-color:#cfdce2">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong></td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <td><xsl:value-of select="codi_d_informaci"/></td>
                                        <td><xsl:value-of select="adre_a"/></td>
                                        <td><xsl:value-of select="codi_postal"/></td>
                                        <td><xsl:value-of select="municipi"/></td>
                                        <td><xsl:value-of select="codi_municipi"/></td>
                                        <td><xsl:value-of select="utm_x"/>, <xsl:value-of select="utm_y"/></td>
                                        <td><xsl:value-of select="georefer_ncia"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
                </div>
                <div class="contenedor">
                    <a id="GIR"></a>
                    <h2><u>TAULA COMISSARIES DE LA PROVINCIA DE GIRONA</u></h2>
                    <!-- Taula de totes les comissaries que formen part de la provincia de Girona -->
                    <div class="contenedor-tabla">
                        <table border="1">
                            <tr bgcolor="#B1FFF0">
                                <th style="text-align:center">Unitat</th>
                                <th style="text-align:center">Codi Info</th>
                                <th style="text-align:center">Adreça</th>
                                <th style="text-align:center">Codi Postal</th>
                                <th style="text-align:center">Municipi</th>
                                <th style="text-align:center">Codi Municipi</th>
                                <th style="text-align:center">UTM X / Y</th>
                                <th style="text-align:center">Georeferència</th>
                            </tr>
                            <xsl:for-each select="/comissaries/row">
                                <xsl:sort select="municipi"/>
                                <xsl:if test="starts-with(codi_postal, '17')">
                                    <tr>
                                        <xsl:choose>
                                            <xsl:when test="starts-with(unitat, 'Guàrdia')">
                                                <td style="background-color:LightSteelBlue">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong>
                                                </td>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <td style="background-color:#cfdce2">
                                                    <strong style="color:#003f75">
                                                        <xsl:value-of select="unitat"/></strong></td>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <td><xsl:value-of select="codi_d_informaci"/></td>
                                        <td><xsl:value-of select="adre_a"/></td>
                                        <td><xsl:value-of select="codi_postal"/></td>
                                        <td><xsl:value-of select="municipi"/></td>
                                        <td><xsl:value-of select="codi_municipi"/></td>
                                        <td><xsl:value-of select="utm_x"/>, <xsl:value-of select="utm_y"/></td>
                                        <td><xsl:value-of select="georefer_ncia"/></td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
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