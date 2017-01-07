#! /Perl64/bin/perl

use SNMP_util;
require "cgilib.pl";

&PrintHeader();

$MIB1 = ".1.3.6.1.2.1.2.2.1.5";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
for($i=1;$i<=9;$i++){
($value[$i]) = &snmpget("$HOST", "$MIB1.$i");
$value[$i] = $value[$i] / 1000000;
#print $value[$i];
}

# 分割線

$MIB1 = ".1.3.6.1.2.1.17.4.3.1.2";
$HOST = "public\@192.168.1.1";
($MIB1) && ($HOST) || die "Usage: $0 MIB_OID HOSTNAME";
($valuemac) = &snmpgetnext("$HOST","$MIB1");
#my $value = hex substr $value, 0, 1, '';
#$value = "0" . $value;
#use Encode qw(decode encode);
#$value = decode('utf8', $value,     Encode::FB_CROAK);
#$octets     = encode('UTF-8', $characters, Encode::FB_CROAK);


#my @months = map hex, qw/x240 x118 x28 x116 x212 x164 /;
#print "$_\n" for @months;

my $valuemac = substr $valuemac, 23;
#print $valuemac;


my @strr;

my @valuemacs = split(':', $valuemac);
$k=0;
foreach my $val (@valuemacs) {
  $strr[$k] = $val;
  #print "$val\n";
  $k++;
}

my $mac = $strr[0];
$port = $strr[1];
print $mac;
#print $strr[1];


my @macadd;

my @macs = split('\.', $mac);

$k=0;
foreach my $va (@macs) {
  $macadd[$k] = sprintf("%x" , $va);
  print "$macadd[$k]\n";
  $k++;
}

my $macvalue = $macadd[0] . "\." . $macadd[1] . "\." . $macadd[2] . "\." . $macadd[3] . "\.". $macadd[4] . "\.". $macadd[5] ;

print $macvalue;

print "<script type=\"text/javascript\">window.location.href = \"portStatus.pl?p1=$value[1]&p2=$value[2]&p3=$value[3]&p4=$value[4]&p5=$value[5]&p6=$value[6]&p7=$value[7]&p8=$value[8]&p9=$value[9]&mac=$macvalue&port=$port\"</script>";
