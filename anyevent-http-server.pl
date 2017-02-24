#!/usr/local/bin/perl

use FindBin;use lib "$FindBin::Bin/../blib/lib";
use AnyEvent::HTTP::Server;
use EV;
use Data::Dumper;

$| = 1;
my $server = AnyEvent::HTTP::Server->new(
     host => "0.0.0.0",
     port => "19999",
     cb => sub {
        my $request = shift;
        my $status  = 200;
        #my $message = $request[8]->('content-message');
        #print Dumper($request);
        my $message = $request->contentmessage();
        print "message:$message\n";
        my $workid = $request->param('work');
        my $content = "<h1>work:$workid</h1>";
        print "content:$content\n";
        #print "work:$workid\n";
        #Content-Type: text/htm
        #Connection: close
        my $headers = { 'content-type' => 'text/html','connection' => 'close' };
        #my $headers = { 'content-type' => 'text/html'};
        $request->reply($status, $content, headers => $headers);
	},
);

$server->listen;
$server->accept;
EV::loop();
