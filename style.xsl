<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet  [
<!ENTITY nbsp   "&#160;">
<!ENTITY copy   "&#169;">
<!ENTITY reg    "&#174;">
<!ENTITY trade  "&#8482;">
<!ENTITY mdash  "&#8212;">
<!ENTITY ldquo  "&#8220;">
<!ENTITY rdquo  "&#8221;"> 
<!ENTITY pound  "&#163;">
<!ENTITY yen    "&#165;">
<!ENTITY euro   "&#8364;">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:variable name="mayus" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'"/>
  <xsl:variable name="minus" select="'abcdefghijklmnopqrstuvwxyz'"/>

  <xsl:template match="/">

    <html lang="en">
      <head>
        <title>Pokédex</title>
        <!-- Required meta tags -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"/>
        <link rel="stylesheet" href="css/style.css"/>
      </head>
      <body>
        <header class="container pt-5 px-5">
          <h1 class="text-center bg-dark text-light">POKEDEX</h1>
          <h4 class="text-center text-light"><xsl:value-of select="pokedex/definition"/></h4>
        </header>
        <div class="types container text-center text-light pt-5">
          <h2>TYPES</h2>
          <div class="row justify-content-center">
            <xsl:for-each select="pokedex/types/type">
              <div class="col-xl-4 col-md-6 col-sm-12 d-flex">
                <div class="card flex-fill py-0 bg-transparent mb-3">
                  <div class="card-body p-1">
                    <img src="img/{translate(., $mayus, $minus)}_type.png" alt="type"/>
                    <p class="card-text text-white"><xsl:value-of select="."/></p>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>

        </div>
        <div class="pokemon container text-center text-light pt-5">
          <h2>POKEMONS</h2>
          <div class="row justify-content-center">
            <xsl:for-each select="pokedex/pokemon">
              <div class="col-xl-6 col-md-12 d-flex">
                <div class="card flex-fill bg-transparent mb-4">
                  <div class="row">
                    <div class="col-xl-6">
                      <img class="card-img" src="https://assets.pokemon.com/assets/cms2/img/pokedex/detail/{dex}.png" alt=""/>
                    </div>
                    <div class="col-xl-6">
                      <div class="card-body2">
                        <h4 class="card-title pt-4"><xsl:value-of select="species"/></h4>
                        <xsl:for-each select="baseStats">
                          <p class="card-text">
                            HP: <xsl:value-of select="HP"/><br/> 
                            ATK: <xsl:value-of select="ATK"/><br/> 
                            DEF: <xsl:value-of select="DEF"/><br/> 
                            SPD: <xsl:choose>
                              <xsl:when test="SPD &gt; 99">
                                <span class="text-danger"><xsl:value-of select="SPD"/></span>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:value-of select="SPD"/>
                              </xsl:otherwise>
                            </xsl:choose> <br/>
                            SATK: <xsl:value-of select="SATK"/></p>
                        </xsl:for-each>
                        <xsl:for-each select="types/type">
                          <img src="img/{translate(., $mayus, $minus)}_type.png" alt="type" class="mr-1"/>
                        </xsl:for-each>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </xsl:for-each>
          </div>
          <footer>
            <h3 class="bg-footer p-3 mt-4">EL MUNDO POKEMON EN AZARQUIEL - S1DAM<img class="pokeball" src="img/Pokeball.png" alt="pokeball"/></h3>
          </footer>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
      </body>
    </html>

  </xsl:template>
</xsl:stylesheet>