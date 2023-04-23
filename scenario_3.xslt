<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    function createChart(labels, data, chartId) {
                        var ctx = document.getElementById(chartId).getContext('2d');
                        var chart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Gender distribution',
                                    backgroundColor: ['#ff6384', '#36a2eb'],
                                    data: data,
                                }]
                            },
                            options: {}
                        });
                    }
                    function createChart2(labels, data, chartId) {
                        var ctx = document.getElementById(chartId).getContext('2d');
                        var chart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'Age distribution',
                                    backgroundColor: ['#ff6384', '#36a2eb', '#ffce56'],
                                    data: data,
                                }]
                            },
                            options: {}
                        });
                    }

                    
                    var femaleCount = <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='F'])"/>;
                    var maleCount = <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='M'])"/>;

                    var age1 = <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@age &lt; 18])"/>;
                    var age2 = <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@age &gt;= 18 and @age &lt;= 30])"/>;
                    var age3 = <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@age &gt; 30])"/>;

                </script>
            </head>
            <body onload="createChart(['Female', 'Male'], [femaleCount, maleCount], 'chart1'); createChart2(['&lt;18', '18-30', '&gt;30'], [age1, age2, age3], 'chart2')">
                <div style="height:4cm; width:4cm;">
                    <canvas id="chart1" width="100" height="100"></canvas>
                    <canvas id="chart2" width="100" height="100"></canvas>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>




<!-- 

  <xsl:template match="/">
    <html>
        <head>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
            <link rel="stylesheet" href="style.css"/>
            <link rel="preconnect" href="https://fonts.googleapis.com"/>
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
            <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&amp;family=Montserrat:ital,wght@0,200;1,200&amp;display=swap" rel="stylesheet"/>
        </head>
        <body>
            <h1>
                <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique)"/> offres disponibles.
            </h1>
            <h2>
                <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client)"/> Clients.
            </h2>
            <h3>
                <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='F'])"/> Femmes.
            </h3>
            <h3>
                <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='M'])"/> Hommes.
            </h3>

            <br/>
            <br/>

            <h1>Répartition des clients par sexe</h1>
            <div class="graph">
            <div class="bar fem">
                <div class="value">
                <xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='F'])"/>
                </div>
                <div class="label">Femmes</div>
                <div class="percent">
                <xsl:value-of select="format-number(count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='F']) div count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client)*100, '#0')"/>%
                </div>
            </div>
            <div class="bar masc">
                <div class="value">
                <xsl:value-of select="count(//client[@sexe='M'])"/>
                </div>
                <div class="label">Hommes</div>
                <div class="percent">
                <xsl:value-of select="format-number(count(//client[@sexe='M']) div count(//client)*100, '#0')"/>%
                </div>
            </div>
            </div>
        </body>
        </html>
    </xsl:template>

 -->