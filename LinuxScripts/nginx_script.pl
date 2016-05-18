#!/usr/bin/perl
# Monitor Nginx

=usage
The returned values are as follows:

Active – This component returns the number of all open connections. This does not mean the number of users. A single user for a single page view can open many concurrent connections to the server.

Accepted – This component returns the total number of accepted connections. Usually it is the same number as the Handled statistic.

Handled – This component returns the total handled connections. Usually it is the same number as the Accepted statistic.

Requests – This component returns the number of handles requests. This is usually greater than Handled value.

Requests per Connection – This component returns the number of requests per connection handled by Nginx.

Reading – This component returns the number of currently reading requests header.

Writing – This component returns the number of currently reading requests body, processing requests, or writing responses to a client.

Waiting – This component returns the number of keep-alive connections, calculated as: Active-(Reading+Writing). Non-zero values do not always mean poor performance because this value depends on the keepalive-timeout setting.

Note: Before using this monitor, the correct argument should be set. This monitor requires the following arguments:
   perl ${SCRIPT} ip_address port
where
  ip_address – is the IP address of the target server. The localhost or loopback address could be used here. The default value is 127.0.0.1.
 port - This is the port number under which Nginx operate. The default value is  80. 

Below is an example using the Scripts Arguments field:
perl ${SCRIPT} 127.0.0.1 80
=cut


$server=$ARGV[0];
$sport=$ARGV[1];
if ($server eq '')
  {
  print "Message: Can't find \"server\" argument. Please provide hostname or IP address of target server.\n";
  exit 1;
  }
if ($sport eq '')
  {
  print "Message: Can't find \"port\" argument. Please provide TCP port number of running nginx instance.\n";
  exit 1;
  }
$arg="http://";
$arg2=":";
$arg3="/nginx_status";
$url=${arg}.${server}.${arg2}.${sport}.${arg3};
@out=`curl $url`;
$exit=`echo $?`;
if ( $exit != 0 )
  {
  print "Message: Problems with execution \"curl $url\" command. Try to run command on server.\n";
  exit 1;
  }
for ($i=0;$i<@out;$i++)
  {
  if ($out[$i] =~ "404 Not Found")
    {
    print "Message: Nginx status page not found. Check Nginx configuration.\n";
    exit 1;
    }
  if ($out[$i] =~ "Active connections:") 
    {
    @tmp = split(": ",$out[$i]);
    $stat1 = $tmp[1];
    }
  if ($brk == 1) 
    {
    @tmp = split(" ",$out[$i]);
    $stat2 = $tmp[0];
    $stat3 = $tmp[1];
    $stat4 = $tmp[2];
	if ($stat3 == 0) 
	  {
      $stat5 = 0;
      }
    else
      {
	  $stat5 = $stat4/$stat3;
	  }
    $brk=0;
    }
  if ($out[$i] =~ "server accepts handled requests") 
    {
    $brk=1;
    }
  if ($out[$i] =~ "Reading: ") 
    {
    @tmp = split(" ",$out[$i]);
    $stat6 = $tmp[1];
    $stat7 = $tmp[3];
    $stat8 = $tmp[5];
    }
  }
print "Statistic.Active: $stat1\n";
print "Statistic.Accepted: $stat2\n";
print "Statistic.Handled: $stat3\n";
print "Statistic.Requests: $stat4\n";
print "Statistic.Requests_per_Connection: ";
printf ("%.3f\n", $stat5);
print "Statistic.Reading: $stat6\n";
print "Statistic.Writing: $stat7\n";
print "Statistic.Waiting: $stat8\n";
exit 0;