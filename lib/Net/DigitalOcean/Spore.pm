package Net::DigitalOcean::Spore;
BEGIN {
  $Net::DigitalOcean::Spore::AUTHORITY = 'cpan:FFFINKEL';
}
{
  $Net::DigitalOcean::Spore::VERSION = '0.001';
}

#ABSTRACT: DigitalOcean SPORE REST Client

use Moose;
use namespace::autoclean;

use Dir::Self;
use Net::HTTP::Spore 0.06;


has _client => (
	is      => 'ro',
	isa     => 'Net::HTTP::Spore',
	lazy    => 1,
	builder => '_build__client',
	handles => qr/.*/,
);


sub _build__client {
	my $self   = shift;
	my $dir = __DIR__ . '../../../digital_ocean.json';
	my $client = Net::HTTP::Spore->new_from_spec( $dir );
	$client->enable('Format::JSON');
	return $client;
}


__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Net::DigitalOcean::Spore - DigitalOcean SPORE REST Client

=head1 VERSION

version 0.001

=head1 NAME

Net::DigitalOcean::Spore - DigitalOcean SPORE REST Client

=head1 ATTRIBUTES

=head2 _client

REST client

=head2 _build__client

=head1 SEE ALSO

=head1 AUTHOR

Matt Finkel <fffinkel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Matt Finkel.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
