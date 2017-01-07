#! /Perl64/bin/perl

use SNMP_util;
require "cgilib.pl";

&PrintHeader();

$MIB = ".1.3.6.1.4.1.890.1.5.8.19.8";
$HOST = "public\@192.168.1.1";
for($i=4;$i<=9;$i++){
($value[$i]) = &snmpget("$HOST", "$MIB.$i.0");
}

print "<script type=\"text/javascript\">window.location.href = \"testHere.pl?year=$value[4]&month=$value[5]&day=$value[6]&hour=$value[7]&minute=$value[8]&second=$value[9]\"</script>";
