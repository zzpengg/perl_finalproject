#!/Perl64/bin/perl

require "cgilib.pl";
use SNMP_util;
&PrintHeader();
$MIB1 = ".1.3.6.1.4.1.890.1.5.8.19.9.3.0";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
($value) = &snmpset("$HOST","$MIB1", 'INTEGER',1);

if ($value) { #print "Results :$MIB1: :$value:\n"; }
else { warn "No response from host :$HOST:\n"; }

print "<script type=\"text/javascript\">window.location.href = \"system.pl?success=$value\"</script>";
