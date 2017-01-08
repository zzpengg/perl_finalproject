#! /Perl64/bin/perl

use SNMP_util;
print("Content-Type : text/html\n\n");
# $dnsIpAddress_MIB = "1.3.6.1.4.1.890.1.5.8.19.11.1";
# $mgmtEntryIp_MIB = "1.3.6.1.4.1.890.1.5.8.19.11.6.1.1";
# $mgmtEntryGateway_MIB = "1.3.6.1.4.1.890.1.5.8.19.11.6.1.3";
# $defaultMgmtStaticIp_MIB = "1.3.6.1.4.1.890.1.5.8.19.11.2.3";
# $staticRouteIp_MIB = "1.3.6.1.4.1.890.1.5.8.19.17.2.1.2";
# $rateLimitSetup_MIB = "1.3.6.1.4.1.890.1.5.8.19.2";
# $rateLimitSetup1_MIB = "1.3.6.1.4.1.890.1.5.8.19.2.0";
# $rateLimitSetupLoad_MIB = "1.3.6.1.4.1.890.1.5.8.19.2.1.0";
$rateLimitPortIngRate_MIB = "1.3.6.1.4.1.890.1.5.8.19.2.2.1.2";
$rateLimitPortEgrRate_MIB = "1.3.6.1.4.1.890.1.5.8.19.2.2.1.3";
$rateLimitPortStatus_MIB = "1.3.6.1.4.1.890.1.5.8.19.2.2.1.5";

$HOST = "public\@192.168.1.1";

# (@dnsIpAddress) = &snmpwalk("$HOST","$dnsIpAddress_MIB");
# (@mgmtEntryIp) = &snmpwalk("$HOST","$mgmtEntryIp_MIB");
# (@mgmtEntryGateway) = &snmpwalk("$HOST","$mgmtEntryGateway_MIB");
# (@defaultMgmtStaticIp) = &snmpwalk("$HOST","$defaultMgmtStaticIp_MIB");
# (@staticRouteIp) = &snmpwalk("$HOST","$staticRouteIp_MIB");
(@rateLimitPortIngRate) = &snmpwalk("$HOST","$rateLimitPortIngRate_MIB");
(@rateLimitPortEgrRate) = &snmpwalk("$HOST","$rateLimitPortEgrRate_MIB");
(@rateLimitPortStatus) = &snmpwalk("$HOST","$rateLimitPortStatus_MIB");
#(@rateLimitSetup1) = &snmpgetnext("$HOST","$rateLimitSetup_MIB");
#(@rateLimitSetup2) = &snmpset("$HOST","$rateLimitSetup_MIB",'INTEGER',200);

#print @dnsIpAddress;
#print $mgmtEntryIp;
#print @mgmtEntryGateway;
#print @defaultMgmtStaticIp;
#print @staticRouteIp;
#@rateLimitSetup;

my @PortIn;
$k=0;
foreach $pair (@rateLimitPortIngRate) {
  @slide = split(':', $pair);
  $PortIn[$k] = $slide[1];
  #print $PortIn[$k] . "\n";
  $k++;
}

my @PortOut;
$k=0;
foreach $pair (@rateLimitPortEgrRate) {
  @slide = split(':', $pair);
  $PortOut[$k] = $slide[1];
  #print $PortOut[$k] . "\n";
  $k++;
}
my @PortStatus;
$k=0;
foreach $pair (@rateLimitPortStatus) {
  @slide = split(':', $pair);
  if($slide[1]==2){
    $PortStatus[$k] = "none"
  }
  else{
    $PortStatus[$k] = "starting"
  }
  #print $PortStatus[$k] . "\n";
  $k++;
}
# close(1) , open(2)
# print "\n";
# print @rateLimitSetup1;
# print @rateLimitSetup2;

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

  <body>
  <div class="container">
    <table class="table table-bordered">
      <thead>
        <tr>
          <td>port</td>
          <td>rateLimitStatus</td>
          <td>rateLimitPortIngRate</td>
          <td>rateLimitPortEgrRate</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>$PortStatus[0]</td>
          <td>$PortIn[0]</td>
          <td>$PortOut[0]</td>
        </tr>
        <tr>
          <td>2</td>
          <td>$PortStatus[1]</td>
          <td>$PortIn[1]</td>
          <td>$PortOut[1]</td>
        </tr>
        <tr>
          <td>3</td>
          <td>$PortStatus[2]</td>
          <td>$PortIn[2]</td>
          <td>$PortOut[2]</td>
        </tr>
        <tr>
          <td>4</td>
          <td>$PortStatus[3]</td>
          <td>$PortIn[3]</td>
          <td>$PortOut[3]</td>
        </tr>
        <tr>
          <td>5</td>
          <td>$PortStatus[4]</td>
          <td>$PortIn[4]</td>
          <td>$PortOut[4]</td>
        </tr>
        <tr>
          <td>6</td>
          <td>$PortStatus[5]</td>
          <td>$PortIn[5]</td>
          <td>$PortOut[5]</td>
        </tr>
        <tr>
          <td>7</td>
          <td>$PortStatus[6]</td>
          <td>$PortIn[6]</td>
          <td>$PortOut[6]</td>
        </tr>
        <tr>
          <td>8</td>
          <td>$PortStatus[7]</td>
          <td>$PortIn[7]</td>
          <td>$PortOut[7]</td>
        </tr>
        <tr>
          <td>9</td>
          <td>$PortStatus[8]</td>
          <td>$PortIn[8]</td>
          <td>$PortOut[8]</td>
        </tr>
      </tbody>
    </table>
  </div>
  </body>
</html>
HERE
print $html;
