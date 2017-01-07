#! /Perl64/bin/perl
require "cgilib.pl";
use SNMP_util;

&PrintHeader();

$html = << "HERE";
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>date</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
  </head>
  <!--<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" integrity="sha384-3ceskX3iaEnIogmQchP8opvBy3Mi7Ce34nWjpBIwVTHfGYWQS9jwHDVRnpKKHJg7" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" integrity="sha384-XTs3FgkjiBgo8qjEjBk0tGmf3wPrWtA6coPfQDfFEY8AnYJwjalXCiosYRBIBZX8" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" integrity="sha384-BLiI7JTZm+JWlgKa0M0kGRpJbF2J8q+qreVrKBC47e3K6BW78kGLrCkeRX6I9RoK" crossorigin="anonymous"></script>
  <script type="text/javascript">
    var strUrl = location.search;
    var getPara, ParaVal;
    var aryPara = [];

    if(strUrl.indexOf("?") != -1){
      var getSearch = strUrl.split("?");
      getPara = getSearch[1].split("&");
      for(i=0;i<getPara.length;i++){
        ParaVal = getPara[i].split("=");
        aryPara.push(ParaVal[0]);
        if(ParaVal[1])
          aryPara[ParaVal[0]] = ParaVal[1];
        else
          aryPara[ParaVal[0]] = 0;
      }
    }
    function loadDate(){
      var HTML = "<table border=1 width=100%>";
      HTML += "<tr>";
        HTML += "<td align=center>"+Port+"</td>";
        HTML += "<td align=center>"+Speed+"</td>";
        HTML += "<td align=center>"+Macaddress+"</td>";
      HTML += "</tr>";

      if(aryPara.port)
      {
        HTML += "<tr>";
          HTML += "<td align=center>"+aryPara.port+"</td>";
          HTML += "<td align=center>"+aryPara.speed+"</td>";
          HTML += "<td align=center>"+aryPara.mac+"</td>";
        HTML += "</tr>";
      }

      HTML += "</table>";
      document.getElementById("outputDiv").innerHTML = HTML;
      /*
      if(aryPara.p1)
        document.getElementById("date").innerHTML = aryPara.p1;
      else
        document.getElementById("date").innerHTML = "none";

      if(aryPara.p2)
        document.getElementById("date").innerHTML = aryPara.p2;
      else
        document.getElementById("date").innerHTML = "none";
        if(aryPara.p3)
          document.getElementById("date").innerHTML = aryPara.p3;
        else
          document.getElementById("date").innerHTML = "none";

        if(aryPara.p4)
          document.getElementById("date").innerHTML = aryPara.p4;
        else
          document.getElementById("date").innerHTML = "none";

          if(aryPara.p5)
            document.getElementById("date").innerHTML = aryPara.p5;
          else
            document.getElementById("date").innerHTML = "none";

          if(aryPara.p6)
            document.getElementById("date").innerHTML = aryPara.p6;
          else
            document.getElementById("date").innerHTML = "none";

            if(aryPara.p7)
              document.getElementById("date").innerHTML = aryPara.p7;
            else
              document.getElementById("date").innerHTML = "none";

            if(aryPara.p8)
              document.getElementById("date").innerHTML = aryPara.p8;
            else
              document.getElementById("date").innerHTML = "none";

              if(aryPara.p9)
                document.getElementById("date").innerHTML = aryPara.p9;
              else
                document.getElementById("date").innerHTML = "none";*/
    }
  </script>
  <body onload="loadDate()">
    <a href="getPortStatus.pl">獲得</a>
    <div id="outputDiv"></div>
  </body>
</html>
HERE
print $html;
