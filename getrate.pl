#! /Perl64/bin/perl

use SNMP_util;

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
foreach $pair (@rateLimitPortIngRate) {
   print $pair . "\n";
}
foreach $pair (@rateLimitPortEgrRate) {
   print $pair . "\n";
}
foreach $pair (@rateLimitPortStatus) {
   print $pair . "\n";
}
# close(1) , open(2)
# print "\n";
# print @rateLimitSetup1;
#print @rateLimitSetup2;
