#!/Perl64/bin/perl
#filename: /opt/local/perl_scripts/snmpget.pl
require "cgilib.pl";
use SNMP_util;
&PrintHeader();
$MIB1 = ".1.3.6.1.4.1.890.1.5.8.19.9.4.0";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
($value) = &snmpgetnext("$HOST","$MIB1");
#my @value;
#(@value) = &snmpwalk("$HOST","$MIB1");
#print $value[3]."\n";
#print $value[7]."\n";
#my $value = hex substr $value, 0, 1, '';
#$value = "0" . $value;
#use Encode qw(decode encode);
#$value = decode('utf8', $value,     Encode::FB_CROAK);
#$octets     = encode('UTF-8', $characters, Encode::FB_CROAK);


#my @months = map hex, qw/x240 x118 x28 x116 x212 x164 /;
#print "$_\n" for @months;

#my $value = substr $value, 23;
#print $value;


#my @strr;

#my @values = split(':', $value);
#$k=0;
#foreach my $val (@values) {
  #$strr[$k] = $val;
  #print "$val\n";
  #$k++;
#}

#print $strr[0];
#print $strr[1];

if ($value) { print "Results :$MIB1: :$value:\n"; }
else { warn "No response from host :$HOST:\n"; }
#($result) = &snmpset("$HOST", "$MIB1", 'integer', 2000);

#print $result;
