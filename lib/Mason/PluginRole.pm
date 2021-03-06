package Mason::PluginRole;

use Moose::Role                ();
use Method::Signatures::Simple ();
use Moose::Exporter;
Moose::Exporter->setup_import_methods( also => ['Moose::Role'] );

sub init_meta {
    my $class     = shift;
    my %params    = @_;
    my $for_class = $params{for_class};
    Method::Signatures::Simple->import( into => $for_class );
    Moose::Role->init_meta(@_);
}

1;

__END__

=pod

=head1 NAME

Mason::PluginRole - Helper for defining Mason plugin roles

=head1 SYNOPSIS

    # instead of use Moose::Role;
    use Mason::PluginRole;

=head1 DESCRIPTION

A variant on Moose::Role that can be used in Mason plugin roles. Using this
module is equivalent to

    use Moose::Role;
    use Method::Signatures::Simple;
