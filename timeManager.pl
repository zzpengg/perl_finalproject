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
    var time_message = aryPara.year + "年" + aryPara.month + "月" + aryPara.day + "日" +
                       aryPara.hour + "小時" + aryPara.minute + "分" + aryPara.second + "秒";
    function loadDate(){
      if(aryPara.year)
        document.getElementById("date").innerHTML = time_message;
      else
        document.getElementById("date").innerHTML = "";
    }
  </script>
  <body onload="loadDate()">
    <a href="getTime.pl">獲得SW目前時間</a>
    <p id="date"></p>
    <form action="setTime.pl" method="POST" class="form-inline">
      <div class="form-group" style="width:200px;">
        <label for="year">年</label>
          <select class="form-control" name="year">
            <option>2000</option>
            <option>2001</option>
            <option>2002</option>
            <option>2003</option>
            <option>2004</option>
            <option>2005</option>
            <option>2006</option>
            <option>2007</option>
            <option>2008</option>
            <option>2009</option>
            <option>2010</option>
            <option>2011</option>
            <option>2012</option>
            <option>2013</option>
            <option>2014</option>
            <option>2015</option>
            <option>2016</option>
            <option>2017</option>
            <option>2018</option>
            <option>2019</option>
            <option>2020</option>
            <option>2021</option>
            <option>2022</option>
            <option>2023</option>
            <option>2024</option>
            <option>2025</option>
            <option>2026</option>
            <option>2027</option>
            <option>2028</option>
            <option>2029</option>
            <option>2030</option>
          </select>
      </div>
      <div class="form-group" style="width:200px;">
        <label for="month">月</label>
          <select class="form-control" name="month">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
          </select>
      </div>
      <div class="form-group" style="width:200px;">
        <label for="month">日</label>
          <select class="form-control" name="day">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
            <option>13</option>
            <option>14</option>
            <option>15</option>
            <option>16</option>
            <option>17</option>
            <option>18</option>
            <option>19</option>
            <option>20</option>
            <option>21</option>
            <option>22</option>
            <option>23</option>
            <option>24</option>
            <option>25</option>
            <option>26</option>
            <option>27</option>
            <option>28</option>
            <option>29</option>
            <option>30</option>
            <option>31</option>
          </select>
      </div>
      <div class="form-group" style="width:200px;">
        <label for="month">時</label>
          <select class="form-control" name="hour">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
          </select>
      </div>
      <div class="form-group" style="width:200px;">
        <label for="month">分</label>
          <select class="form-control" name="minute">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
            <option>6</option>
            <option>7</option>
            <option>8</option>
            <option>9</option>
            <option>10</option>
            <option>11</option>
            <option>12</option>
          </select>
      </div>
      <input type="submit" value="Submit" class="btn btn-primary">
    </form>
  </body>
</html>
HERE
print $html;
