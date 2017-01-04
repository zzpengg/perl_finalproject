#! /Perl64/bin/perl

print("Content-Type : text/html\n\n");
print "hello world\n";
print("<!-- Latest compiled and minified JavaScript --><script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>");

$var = 523;
print "$var\n";

$var = $var % 7;
print $var;

$bo = "bo";
print "$bo" x 5;
print "\n";

$str = "John like it";
if($str =~ /like it/){
  print "Found\n";
}
else{
  print "Not Found";
}

$str1="bc";
$str2="acca";
# 字串大小是比字典序
if ($str1 gt $str2) {
       print "The first one is greater\n";
} else {
       print "The second one is greater!\n";
}

$v1 = '324';     #字串
print $v1 * 2;  #(欲計算數值)

$name = 'Foo';
$message = << "HERE";
Dear $name,

     This is a message I plan to send to you.

regards

Perl
HERE

print $message;

$result="2,4,6,1,3,5,a,b,c";
@total = split(/,/, $result);     # 此時@total為246135abc
$i=0;
while ($i <= $#total) {
      print '$total['.$i.'] ===> ' . $total[$i] . "\n";
      $i++;
}

for($i=0;$i<5;$i++){
  ${"kkk$i"} = "ooo$i";

  print("kkk".$i."===>".${"kkk$i"});
  print("<button class=\"btn btn-primary\">Hello<button>\n");
}
%A = ("m"=>"1","n"=>"5","p"=>"2","g"=>"9");
@keys = keys %A;
print("the keys in %A are: ");
foreach $item (@keys){
  print("$item");
}
my $return = cal();
print ("$return");

sub cal {
  my $param = $ARGV[0] || 3;
  ($param > 4) ? $param*2 : $param**2;
}
