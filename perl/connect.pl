use strict;
use warnings;
use utf8;
use WWW::Mechanize;


#################
my $username = 'user';
my $password = 'user';
my $url = 'http://192.168.1.1/ntt/basic/v4pppoe/connect';
my $disconnect_no = 1;
################

my $mech = WWW::Mechanize->new();
$mech->credentials($username, $password);
$mech->get($url);
my $security_token = $mech->value('SECURITY_TOKEN');
$mech->form_number(1);
$mech->field( 'pppoeSessionID', $disconnect_no );
$mech->field( 'SECURITY_TOKEN', $security_token );
$mech->submit();
