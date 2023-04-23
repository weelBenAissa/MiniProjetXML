<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"/>
                <link rel="stylesheet" href="style.css"/>
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous"/>
                <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&amp;family=Montserrat:ital,wght@0,200;1,200&amp;display=swap" rel="stylesheet"/>
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                <script>
                    function createChart(labels, data, chartId) {
                        var ctx = document.getElementById(chartId).getContext('2d');
                        var chart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: labels,
                                datasets: [{
                                    label: 'distribution Sexe',
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
                                    label: 'distribution Age',
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

                    function createChartTitle(title, chartId) {
                        var ctx = document.getElementById(chartId).getContext('2d');
                        var chart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                labels: [title],
                                datasets: [{
                                    label: '',
                                    backgroundColor: ['rgba(0,0,0,0)'],
                                    data: [1],
                                }]
                            },
                            options: {
                                plugins: {
                                    legend: {
                                        display: false
                                    },
                                    title: {
                                        display: true,
                                        text: title,
                                        font: {
                                            size: 14,
                                            weight: 'bold'
                                        },
                                        padding: {
                                            top: 10,
                                            bottom: 10
                                        }
                                    }
                                }
                            }
                        });
                    }


                </script>
            </head>
            <body onload="createChart(['Femme', 'Homme'], [femaleCount, maleCount], 'chart1'); createChart2(['&lt;Inférieur à 18', 'Entre 18 et 30', '&gt;Supérieur à 30'], [age1, age2, age3], 'chart2')">
                <h1>Visualisation des statistiques et détails concernant les offres proposées</h1>

                <br/>
                <br/>
                <table id="table">
                    <tr>
                        <th>Statistique</th>
                        <th>Valeur</th>
                    </tr>
                    <tr>
                        <td>Offres disponibles</td>
                        <td><xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique)"/></td>
                    </tr>
                    <tr>
                        <td>Clients</td>
                        <td><xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client)"/></td>
                    </tr>
                    <tr>
                        <td>Femmes</td>
                        <td><xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='F'])"/></td>
                    </tr>
                    <tr>
                        <td>Hommes</td>
                        <td><xsl:value-of select="count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client[@sexe='M'])"/></td>
                    </tr>
                    <tr>
                        <td>Moyenne d'age des clients (en années)</td>
                        <td><xsl:value-of select="sum(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client/@age) div count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/clients/client)"/></td>
                    </tr>
                    
                    <tr>
                        <td>Moyenne des prix</td>
                        <td><xsl:value-of select="sum(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/prix) div count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique)"/></td>
                    </tr>
            
                    <tr>
                        <td>Durée moyenne des séjours (en jours)</td>
                        <td><xsl:value-of select="sum(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique/duree_de_sejour) div count(//centre_de_sejours_linguistiques/offre_de_sejour_linguistique/sejour_linguistique)"/></td>
                    </tr>
        

                </table>
                <br/>
                <br/>

                <div style="height:12cm%; width:20cm; display:flex; margin-left: auto; margin-right: auto; border: 2px solid black;">
                    <div style="height:100%; width:100%;">
                        <canvas id="chart1" width="50%" height="100"></canvas>
                        <h3>Répartition par genre</h3>
                    </div>
                    <div style="height:100%; width:100%;">
                        <canvas id="chart2" width="50%" height="100"></canvas>
                        <h3>Répartition par age</h3>
                    </div>
                </div>

                <br/>
            </body>

        </html>
    </xsl:template>

</xsl:stylesheet>
