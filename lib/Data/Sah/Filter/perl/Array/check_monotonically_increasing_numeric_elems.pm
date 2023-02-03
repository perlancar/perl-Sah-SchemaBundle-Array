package Data::Sah::Filter::perl::Array::check_monotonically_increasing_numeric_elems;

# AUTHOR
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 1,
        might_fail => 1,
        summary => "Check that elements of array are monotonically increasing",
        examples => [
            {value=>[], valid=>1},
            {value=>[1, 3, 2], valid=>0, summary=>"Not monotonically increasing"},
            {value=>[1, 2.9, 3], valid=>1},
        ],
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_filter} = join(
        "",
        "do { ", (
            "my \$ary = $dt; my \$prev; my \$res = [undef, \$ary]; ",
            "for my \$i (0 .. \$#{\$ary}) { if (\$i > 0) { if (\$prev >= \$ary->[\$i]) { \$res->[0] = qq(Elements not monotonically increasing (check element[\$i]) ); last } } \$prev = \$ary->[\$i] } ",
            "\$res ",
        ), "}",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION

This filter rule is exactly like
L<Path::expand_tilde|Data::Sah::Filter::perl::Path::expand_tilde> rule, except
that expansion is only done when running on Unix platforms.
