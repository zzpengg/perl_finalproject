#!/Perl64/bin/perl
#filename: /opt/local/perl_scripts/snmpget.pl
require "cgilib.pl";
use SNMP_util;
&PrintHeader();
$MIB1 = ".1.3.6.1.4.1.890.1.5.8.19.2.2.1.2.1";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
($value) = &snmpset("$HOST","$MIB1", 'integer',200);

if ($value) { print "Results :$MIB1: :$value:\n"; }
else { warn "No response from host :$HOST:\n"; }
