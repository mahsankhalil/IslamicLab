<%-- 
    Document   : index
    Created on : 17-Dec-2019, 14:31:58
    Author     : MAK
--%>

<%@page import="java.util.List"%>
<%@page import="pac.QDH"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .divStyle{
                width:300px;
                height:auto ;
                border:2px solid black;
                margin: 15px;
                padding: 10px;
                background-color: greenyellow;
                cursor: pointer;
            }
            
        </style>
    </head>
   
    <body>
        <p id="surah" class="divStyle" style="width:auto;text-align: right;background: white"></p>
        <%
            QDH q = new QDH();
            
            String[] EnglishNames = q.englishSurahNames;
            String[] UrduNames = q.urduSurahNames;
            
            try{
               for(int i=0;i<EnglishNames.length;i++)
                {
         %>
         <div id="<%=i %>" class="divStyle" >
                    <h1><%=EnglishNames[i]+"  " %>
                    <%=UrduNames[i] %></h1>
                    <h5><%="Total Ayat "+q.surahAyatCount[i] %></h5> 
                    <h5><%="Ayat Start At "+q.SSP[i] %></h5> 
                   
                 </div>
        <%
                } 
            }catch(Exception e){
                out.print("error");
            }
            
        %>
    </body>
    <script src="references/js/jquery.min.js"></script>
    <script>
        $("div").click(function(){
            loadDoc(this.id);
            
        });
        
        function loadDoc(i) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                  if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("surah").innerHTML = this.responseText;
                  }
                };
                xhttp.open("GET", "getSurah?id="+i, true);
                xhttp.send();
              }
    </script>
</html>

