#! /Perl64/bin/perl


use SNMP_util;#要記得把SNMP_itil.pm這個檔案擺進同一個路徑他才會抓到喔^_<

$OID_HOUR = ".1.3.6.1.4.1.890.1.5.8.19.8.4.0"; #這個代表mib的object ID 不同的OID有不同的資訊，可以上網去找一下mib-tree
$HOST = "120.107.172.237";#這個代表你要連上的主機，目前這個是老師ㄉ
($hour) = &snmpget("$HOST", "$OID_HOUR"); #這個呢，代表用snmpget這個函數去抓資料
print $hour;
