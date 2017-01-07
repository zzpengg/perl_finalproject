#! /Perl64/bin/perl

require "cgilib.pl";
use SNMP_util;

$OID_HOUR = ".1.3.6.1.4.1.890.1.5.8.19.8.4.0";
$HOST = "120.107.172.237";
($hour) = &snmpget("$HOST", "$OID_HOUR");
print $hour;
