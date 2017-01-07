#! /Perl64/bin/perl
use strict;
use warnings;
require "cgilib.pl";



use LWP::UserAgent;
use HTTP::Request::Common qw{ POST };
use CGI;

my $md5 = '098f6bcd4621d373cade4e832627b4f6';
my $url = '127.0.0.1/cgi-bin/testHere.pl';

my $ua      = LWP::UserAgent->new();
my $request = POST( $url, [ 'term' => $md5 ] );
my $content = $ua->request($request)->as_string();

my $cgi = CGI->new();
print $cgi->header(), $content;
