#!/Perl64/bin/perl

### ReadParse
# Reads in GET or POST data, converts it to unescaped text, and puts
# one key=value in each member of the list "@in"
# Also creates key/value pairs in %in, using '\0' to separate multiple
# selections

# Returns TRUE if there was input, FALSE if there was no input
# UNDEF may be used in the future to indicate some failure.

# Now that cgi scripts can be put in the normal file space, it is useful
# to combine both the form and the script in one place.  If no parameters
# are given (i.e., ReadParse returns FALSE), then a form could be output.

# If a variable-glob parameter (e.g., *cgi_input) is passed to ReadParse,
# information is stored there, rather than in $in, @in, and %in.

sub ReadForm {
  local (*in) = @_ if @_;
  local ($i, $key, $val);

  # Read in text
  if ($ENV{'REQUEST_METHOD'} eq "GET") {
    $in = $ENV{'QUERY_STRING'};
  } elsif ($ENV{'REQUEST_METHOD'} eq "POST") {
      read(STDIN,$in,$ENV{'CONTENT_LENGTH'});
      if ($ENV{'QUERY_STRING'} =~ /=/) {
        $in = join("&", $in, $ENV{'QUERY_STRING'});
      }
  }

  @in = split(/&/,$in);

  foreach $i (0 ..$#in) {
    # Convert plus's to spaces
    $in[$i] =~ tr/+/ /;

    # Split into key and value
    # splits on the first =
    ($key, $val) = split(/=/,$in[$i],2);

    # Convert %XX from hex numbers to alphanumeric
    $key =~ s/%(..)/pack("C",hex($1))/ge;
    $val =~ s/%(..)/pack("C",hex($1))/ge;

    # Kill SSI command
    $val =~ s/<!--(.|\n)*-->//g;

    # Associate key and value
    # \0 is the multiple separator
    if (defined($in{$key})) {
      $in{$key} = join("\0", $in{$key}, $val);
    } else {
      $in{$key} = $val;
    }
  }

  return 1;
}


### Get Form Name with PATH_INFO
sub GetFormName {
    if ((defined $ENV{PATH_INFO}) && ($ENV{PATH_INFO} =~ /^\/{0,1}(\w+)$/)) {
        return $1;
    } else {
        return 0;
    }
}


### Get callpagename with HTTP_REFERER
sub CallPageName {
    if ((defined $ENV{HTTP_REFERER}) && ($ENV{HTTP_REFERER} =~ /\/([\w\.]+)$/)) {
        return $1;
    } else {
        return 0;
    }
}


### Remove meta characters
sub RmMetachar {
  my ($in)=@_;
  $in =~ s/[\;\<\>\*\|\`\&\$\!\#\(\)\[\]\{\}\:\'\"]//g;
#  $in =~ s/<([^>])*>//sg;
  return ($in);
}


### PrintHeader
sub PrintHeader {
  print "Content-type: text/html\n\n";
}


### RemoteIP
# Return Remote IP
sub RemoteIP {
    if (defined $ENV{HTTP_X_FORWARDED_FOR}) {
	return $ENV{HTTP_X_FORWARDED_FOR};
   } else {
	return $ENV{REMOTE_ADDR};
   }
}


### MyURL
# Returns a URL to the script
sub MyURL  {
  return  'http://' . $ENV{'SERVER_NAME'} .  $ENV{'SCRIPT_NAME'};
}


### CGIError
# Prints out an error message which which containes appropriate headers,
# markup, etcetera.
# Parameters:
#  If no parameters, gives a generic error message
#  Otherwise, the first parameter will be the title and the rest will
#  be given as different paragraphs of the body
sub Output {
  my @msg=@_;
  my $i;

  if (!@msg) {
    my $name = &MyURL;
    @msg = ("Error: script $name encountered fatal error");
  };

  &PrintHeader;
  print "<html><head><title>$msg[0]</title></head>\n";
  print "<body>\n<center><h1>$msg[0]</h1>\n";
  print "<table border=0><td>\n";
  foreach $i (1 .. $#msg) {
    print "<p>$msg[$i]</p>\n";
  }
  print "<br></table>\n<form><input type=button value=\"Ś^¤W¤@­ś\" onclick=\"history.back()\"></form>\n";
  print "</center>\n";
  print "</body></html>\n";

  exit(1);
}


### print variables
sub PrintVar {
  my (%in)=@_;
  my $key;

  foreach $key (keys %in) {
    print "$key = $in{$key}<br>\n";
  }
}


### print %ENV
sub PrintENV {
  my $key;

  foreach $key (sort keys %ENV) {
    print "$key = $ENV{$key}<br>\n";
  }
}


### random functions
# You should set random seed before use function RandomInt
sub SetRandomSeed {
  srand(time|$$);
}


# parameter : ($max)
#               will generate (0..$max) random number
sub Random {
  return int(rand($_[0]));
}


# return now time
#   parameter: any string include time or date or both
#       time replaced hh:mm:ss(24h), date replaced mm/dd/yy
#       you can 'man date' to see date command.
sub Time {
    ($_)=@_;

    s/date/%D/;
    s/times/%r/;
    s/time/%T/;
    my $x=`/bin/date +"$_"`; chop $x;
    return $x;
}

1; #return true
