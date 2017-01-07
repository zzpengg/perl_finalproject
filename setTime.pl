#!/Perl64/bin/perl

use SNMP_util;

local ($buffer, @pairs, $pair, $name, $value, %FORM);
# Read in text
$ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;

if ($ENV{'REQUEST_METHOD'} eq "POST"){
   read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
}else {
   $buffer = $ENV{'QUERY_STRING'};
}

# Split information into name/value pairs
@pairs = split(/&/, $buffer);

foreach $pair (@pairs) {
   ($name, $value) = split(/=/, $pair);
   $value =~ tr/+/ /;
   $value =~ s/%(..)/pack("C", hex($1))/eg;
   $FORM{$name} = $value;
}

$year = $FORM{year};
$month = $FORM{month};
$day = $FORM{day};
$hour = $FORM{hour};
$minute = $FORM{minute};
$second = $FORM{second};
$HOST="192.168.1.1";
$MIB1=".1.3.6.1.4.1.890.1.5.8.19.8.4.0";
$year = &snmpset("public\@$HOST", "$MIB1", 'INTEGER',$year);
#$result = &snmpgetnext("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.4");
#print $result;
$month = &snmpset("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.5.0", 'INTEGER', $month);
$day = &snmpset("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.6.0", 'INTEGER', $day);
$hour = &snmpset("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.7.0", 'INTEGER', $hour);
$minute = &snmpset("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.8.0", 'INTEGER', $minute);
$second = &snmpset("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.9.0", 'INTEGER', $second);

if(!$year){
  $year = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.4.0");
}
if(!$month){
  $month = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.5.0");
}
if(!$day){
  $day = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.6.0");
}
if(!$hour){
  $hour = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.7.0");
}
if(!$minute){
  $minute = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.8.0");
}
if(!$second){
  $second = &snmpget("public\@192.168.1.1", ".1.3.6.1.4.1.890.1.5.8.19.8.9.0");
}


print "Content-type:text/html\r\n\r\n";
#print $result;
#print $year;

print "<script type=\"text/javascript\">window.location.href = \"testHere.pl?year=$year&month=$month&day=$day&hour=$hour&minute=$minute&second=$second\"</script>";

1;
