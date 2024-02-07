<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
      <html>
            <head>
               <title>Progetto di Codifica di testi -Bellini-Filippo</title>
                <script src="https://code.jquery.com/jquery-3.2.1.js" crossorigin="anonymous"></script>
                <script src='javascript.js'></script>
                <link rel="stylesheet" type="text/css" href="mystyle.css" />
            </head>
            <body>
                <div class="intro">
                    <h1 class="prima"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/></h1>
                    <h2 class="prima"><xsl:value-of select="tei:TEI/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:edition"/></h2>
                </div>
                <div id="descrizione">
                    <h2>Descrizione della versione elettronica</h2>
                    <xsl:apply-templates select="//tei:fileDesc"/>
                    <div class="buttons-container">
                        <button id="btn_mostra_info" onclick="mostra_altro()">Mostra altro</button>
                        <button id="btn_mostra_legenda" onclick="mostra_legenda()">Mostra legenda</button>
                    </div>
                    <div class='moreinfo' style="display: none;">
                        <h2>Informazioni Aggiuntive:</h2>
                        <ul>
                            <xsl:apply-templates select="//tei:encodingDesc"/>
                        </ul>
                        <ul>
                            <xsl:apply-templates select="//tei:profileDesc"/>
                        </ul>
                    </div>
                    <div id='legenda' style="display: none;">
                        <h2>Legenda:</h2>
                        <div id='testo_legenda'>
                            <p><strike class='del'>abc</strike> : cancellature</p>
                            <p><mark class='sic'>abc</mark> : errori</p>
                            <p><span class='add'>abc</span> : aggiunte testuali</p>
                            <p><span class='unclear'>abc</span> : testo non completamente chiaro</p>
                            <p><span class='cardinal'>2</span>: numero</p>
                            <p><span class='name'>Nome</span>: Nome di Persona</p>
                            <p><span class='q'> Discorso</span>: Citazione </p>
                        </div>
                    </div>
                </div>
                
                <div class="principale">
                    <xsl:apply-templates select="tei:TEI/tei:facsimile"/>                  
                </div> 
              <footer>
                    <p id='p_footer'>2022-2023</p>
                </footer>                
            </body>

      </html>
  </xsl:template>
    <!-- fileDesc-->
        <xsl:template match="tei:titleStmt" mode="#default">
            <p>Titolo: <b><xsl:value-of select="tei:title"/>.</b></p>
            <p>Autore: <b><xsl:value-of select="tei:author"/>.</b></p>
        </xsl:template>

        <xsl:template match="tei:editionStmt" mode="#default">
            <p><xsl:value-of select="//tei:edition"/>.</p>
            <p>Conversione TEI P5 a cura di <b><xsl:apply-templates select="//tei:name[(@ref='#FB')]"/>.</b></p>
            <p>Progetto condotta da <b><xsl:apply-templates select="//tei:name[(@ref='#AMDG')]"/>.</b></p>
        </xsl:template>

        <xsl:template match="tei:publicationStmt" mode="#default">
            <p>Versione elettronica pubblicata dall' <b><xsl:value-of select="tei:publisher"/>, <xsl:value-of select="tei:pubPlace"/>, <xsl:value-of select="tei:date"/>.</b></p>
            <p><xsl:value-of select="tei:availability"/>.</p>
        </xsl:template>
        <xsl:template match="tei:sourceDesc" mode="#default">
        <div class="fonte">
            <h3>Fonte:</h3>
        
            <p><xsl:apply-templates select="//tei:bibl"/></p>
            <p><xsl:apply-templates select="//tei:msIdentifier"/></p>
            <p><xsl:apply-templates select="//tei:physDesc"/></p>
            <p><xsl:apply-templates select="//tei:history"/></p>
            
        </div>
    </xsl:template>       
        <xsl:template match="tei:bibl">
            <p>Titolo: <b><xsl:value-of select="tei:title"/></b>.</p>
            <p>Autore: <b><xsl:value-of select="tei:author"/></b>.</p>
            <p>Anno: <b><xsl:value-of select="tei:date"/></b>.</p>
        </xsl:template>
        
        <xsl:template match="tei:msIdentifier">
            <p>Luogo: <b><xsl:value-of select="tei:settlement"/>, <xsl:value-of select="tei:country"/></b>.</p>
            <p>Archivio: <b><xsl:element name="a">
                <xsl:attribute name='href'><xsl:value-of select="tei:repository/@ref"/></xsl:attribute>
                <xsl:value-of select="tei:repository"/>
            </xsl:element></b></p>
        </xsl:template>
    
        <xsl:template match="tei:physDesc">
            <p>Formato da <b><xsl:value-of select="tei:objectDesc/tei:supportDesc/[tei:extent/tei:measure]"/></b> di <b><xsl:value-of select="tei:objectDesc/tei:supportDesc/[tei:support]"/></b>.</p>
            <p><xsl:value-of select="tei:objectDesc/tei:supportDesc/tei:condition"/>.</p>           
            <p><xsl:value-of select="tei:objectDesc/tei:layoutDesc/tei:layout"/>.</p>
            <p><b><xsl:value-of select="tei:handDesc"/></b></p>
        </xsl:template>
        
        <xsl:template match="tei:history" mode="#default">
            <p><xsl:value-of select="tei:origin"/></p>
        </xsl:template>


        
    <!-- encodingDesc -->

        <xsl:template match="tei:projectDesc">
            <p>Obiettivo: <b><xsl:value-of select="."/></b></p>    
        </xsl:template>
        
        <xsl:template match="tei:editorialDecl//tei:p">               
            <li><xsl:value-of select="."/></li>
        </xsl:template>
    
        <xsl:template match="tei:charDecl"> 
        
        </xsl:template>
    
        <xsl:template match="tei:refsDecl"> 
            <p><xsl:value-of select="."/></p>
        </xsl:template>

    <!-- profileDesc -->
    <xsl:template match="tei:langUsage">
        <h2>Varietà dialettali</h2> 
        <div class="language">
        <ul>
             <xsl:apply-templates select="tei:language"/>
        </ul>
        </div>
    </xsl:template>

    <xsl:template match="tei:language">
        <li><xsl:value-of select="."/></li>
    </xsl:template>

    <xsl:template match="tei:particDesc/tei:listPerson" mode="#default">
        <h2>Figure riconoscibili:</h2> 
    <xsl:apply-templates select="tei:person"/>
    <br/>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <p>
            <b><xsl:value-of select="tei:name"/></b>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="@role"/>
            <xsl:text>)</xsl:text>
            <xsl:text> : </xsl:text>
            <xsl:value-of select="tei:birth/@when"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="tei:death/@when"/>
        </p>
    </xsl:template>
    
    <xsl:template match="tei:settingDesc" >
        <p><xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="tei:facsimile">
        <xsl:for-each select="tei:surface">
            <div class="pp">
                <xsl:element name="img">
                    <xsl:attribute name="src"><xsl:value-of select="tei:graphic/@url"></xsl:value-of></xsl:attribute>
                    <xsl:attribute name="alt">pagina<xsl:value-of select="@xml:id"></xsl:value-of></xsl:attribute>
                </xsl:element>

                <div class="trascrizione">
                    <p>
                        <xsl:variable name="segnaposto" >
                            <xsl:value-of select="position()"/>
                        </xsl:variable>
                        <span class='note'>
                            <xsl:value-of select="tei:note"></xsl:value-of>
                        </span>
                        <xsl:apply-templates select="//tei:ab[@n=$segnaposto]"/>
                    </p>
                </div>
            </div>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:lb">
        <xsl:element name="br"/>
        <xsl:element name="span">
            <xsl:attribute name="id">
                <xsl:value-of select="@facs"/>
            </xsl:attribute>
            <xsl:attribute name="class"></xsl:attribute>
            <xsl:value-of select="@n" />
        </xsl:element>
    </xsl:template> 
    
    <xsl:template match="tei:dateline">
        <p id="dateline"><xsl:value-of select="."/></p>
    </xsl:template>
    

    <xsl:template match="//tei:pb[@n='96']" mode="#default">
        <h2 id='pb_pg_96'  class='pb_pag'>Pagina 96:</h2>
    </xsl:template>
    <xsl:template match="//tei:pb[@n='97']" mode="#default">
        <h2 id='pb_pg_97'  class='pb_pag'>Pagina 97:</h2>
    </xsl:template>
    <xsl:template match="//tei:pb[@n='100']" mode="#default">
        <h2 id='pb_pg_100'  class='pb_pag'>Pagina 100:</h2>
    </xsl:template>
    
    <xsl:template match="tei:del" mode="#default">
        <strike class='.del'><xsl:value-of select="."/></strike>
    </xsl:template>

    <xsl:template match="tei:q" mode="#default">
    <span class='q'>
        <xsl:apply-templates select="tei:q"/><xsl:value-of select="."/>
    </span>
    </xsl:template>

    <xsl:template match="tei:add" mode="#default">
        <span class='add'>
            <xsl:apply-templates select="tei:add"/><xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <span class='unclear'>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:persName" mode="#default">
        <span class='name'>
            <xsl:apply-templates select="tei:persName"/><xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:sic" mode="#default">
        <span class='choice_sic_corr'>
            <mark class='sic'>da <xsl:value-of select="."/> a </mark>
        </span>
    </xsl:template>

    <xsl:template match="tei:corr" mode="#default">
        <span class='corr'>
            <xsl:apply-templates select="tei:corr"/><xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:num" mode="#default">
        <span class='num' data-value="{@value}">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    <xsl:template match="tei:pc[@type='syllabication']" mode="#default">
        <mark class='syllabication'><xsl:value-of select="."/></mark>
    </xsl:template>
</xsl:stylesheet>