#!/usr/bin/perl

use Data::Dumper qw(Dumper);
use Time::Local;
use HTTP::Date;
use Getopt::Long;

#############################################################################################################
#                                                                                                           #
#                                   CUSTOMIZE SECTION                                                       #
#                                                                                                           #
#############################################################################################################
#
#   Statistic hash
#
my %error_need_to_be_checked = (
        "SqlException" => "Exception: javax.ejb.EJBException: nested exception is: java.sql.SQLException",
        "ConnectionException" => "HTTP transport error: java.net.ConnectException",
        "ORACLE" => "ORA-",
        "CouldNotConnectOverHttp" => "could not connect over HTTP to server: '10.16.4.56', port: '8999'",
        "ORA-04068" => "ORA-04068"
    );

#############################################################################################################
#                                                                                                           #
#                                   PARSER SECTION                                                          #
#                                                                                                           #
#############################################################################################################
my $path;
my $file_name;
my $mins;
my @files = (); 

GetOptions (
        "path=s" => \$path,
        "file=s" => \$file_name,
        "mins=i" => \$mins
    ) or die("Read arguments failed");


#die "Missing parameter: path\n" unless $path;
#die "Missing parameter: file\n" unless $file_name;
#die "Missing parameter: mins\n" unless $mins;
push @files, glob $path . "/" . $file_name;

parsing_log($mins, \%error_need_to_be_checked, \@files);

#############################################################################################################
#                                                                                                           #
#                                   PROCESSING SUBROUTINES                                                  #
#                                                                                                           #
#############################################################################################################

sub open_log {
    my ($file) = @_;
    my $log_file;
    open $log_file, $file;
    return $log_file;
}

sub close_log {
    my ($log_file) = @_;
    close $log_file;
}

sub processing_log {
    my ($log_file, $minute_backward, $messages, $result) = @_;
    my $is_started_parsing = 0;
    while(my $line = <$log_file>) {
        if (is_in_processing_time($line, $minute_backward, $is_started_parsing)) {
            $is_started_parsing = 1;
            foreach my $key (keys %$messages) {
                if (index($line, $$messages{$key}) != -1) {
                    $$result{$key}++;
                }
            }    
        }
    }
}

sub is_in_processing_time {
    my ($line, $minute_backward, $is_started_parsing) = @_;
    
    return $is_started_parsing == 1 if $is_started_parsing == 1;
    
    #if ($line =~ /^\w+\s+(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2}),(\d{3})/) {
    #    print "$1 - $2- $3 -$4 -$5 -$6\n";
    #}

    if ($line =~ /^\w+\s+(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2}),(\d{3})/) {
        $is_started_parsing = 1 if time - timelocal($6,$5,$4,$3,$2-1,$1) <= $minute_backward * 60;
    }

    return $is_started_parsing == 1;
}

sub parsing_log {
    ($minute_backward, $messages, $files) = @_;
    #print "No find was found\n" if scalar @$files < 1;
    #die "No inpput statistics\n" if scalar %$messages < 1;

    foreach (@$files) {
        my %result = ();
        pre_processing($messages, \%result);
        my $log_file = open_log($_);
        processing_log($log_file, $minute_backward, $messages, \%result);
        close_log($log_file);
        if ((scalar @$files) > 1) {
            print "Parsing $_:\n";
        }

        display_result(%result);
    }
}

sub pre_processing {
    my ($messages, $result) = @_;
    foreach my $key (keys %$messages) {
        $$result{$key} = 0;
    }
}

sub display_result {
    my (%result) = @_;
    my $count = 0;
    foreach my $key (keys %result) {
        print "Message.$count: $key occurs $result{$key} times\n";
        print "Statistic.$count: $result{$key}\n";
        $count++;
    }
}