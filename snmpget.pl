#!/Perl64/bin/perl
#filename: /opt/local/perl_scripts/snmpget.pl
require "cgilib.pl";
use SNMP_util;
&PrintHeader();
$MIB1 = ".1.3.6.1.2.1.2.2.1.5.7";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
($value) = &snmpgetnext("$HOST","$MIB1");
#my $value = hex substr $value, 0, 1, '';
#$value = "0" . $value;
#use Encode qw(decode encode);
#$value = decode('utf8', $value,     Encode::FB_CROAK);
#$octets     = encode('UTF-8', $characters, Encode::FB_CROAK);

#print hex($value) ;
#my @months = map hex, qw/x01 x02 x03 x04 x05 x06 x07 x08 x09 x0a x0b x0c/;
#print "$_\n" for @months;


if ($value) { print "Results :$MIB1: :$value:\n"; }
else { warn "No response from host :$HOST:\n"; }
#($result) = &snmpset("$HOST", "$MIB1", 'integer', 2000);
print $result;
