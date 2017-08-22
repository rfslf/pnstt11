#!/usr/bin/perl

## USE
#use strict;
#use warnings;

## ENV
my $path = "/opt/gh/";
my $home = "/home/".`whoami`;
chomp($home);

## Go-go-go
while () {
# system("clear");
 print "########################################\n";
 print "Enter ServerName or Q for exit:\n";
 print "########################################\n";
 print "Srv1\n";
 print "Srv2\n";
 print "########################################\n";

 print "Enter VM name for connect: ";
 my $choice = <STDIN>;
 chomp ($choice);

 $choice =~ s/\.\.//g;
 $choice =~ s/(.*bash)|( sh|\/sh)//g;

 my $srv_conf	= $path.$choice;

 ## for right choice
 if ( "$choice" =~ /^Srv/ ) {
  ## Check that file exist
  if (( ! -e "$srv_conf") && ( "$choice" =~ /$home/ )) {
   my $srv_ip = `cat $srv_conf`;
   print "Server IP: $srv_ip";
   next; 
  }

  ## Get Srv IP from file
  my $srv_ip = `cat $srv_conf`;

  # Check Srv IP
  if ( "$srv_ip" =~ /^\d+\.\d+\.\d+\.\d+$/ ) {
 
   print "Connecting to server ...\n";

   ## SSH connect
   system("clear");

   ## and connect to server
   system("ssh -i /home/remote/.ssh/id_rsa -o StrictHostKeyChecking=no aengineer\@$srv_ip");
  }

 undef $choice;
 }
 ## for exit
 if (( "\U$choice" eq 'Q' ) || ( $choice eq 'quit') || ( $choice eq 'exit' )) { exit; }
}

system("logout");
exit;

