package Data::Sah::Filter::perl::Array::check_elems_numeric_monotonically_decreasing;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    +{
        v => 1,
        might_fail => 1,
        summary => "Check that elements of array are monotonically decreasing numerically",
        examples => [
            {value=>{}, valid=>0, summary=>"Not an array"},
            {value=>[], valid=>1},
            {value=>[1, 3, 2], valid=>0, summary=>"Not monotonically decreasing"},
            {value=>[2, 2, 1], valid=>0, summary=>"Not monotonically decreasing"},
            {value=>[3, 2.9, 1], valid=>1},
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
            "my \$ref = ref \$ary; ",
            "if (\$ref ne 'ARRAY') { \$res->[0] = 'Not an array' } else { for my \$i (0 .. \$#{\$ary}) { if (\$i > 0) { if (\$prev <= \$ary->[\$i]) { \$res->[0] = qq(Elements not monotonically increasing (check element[\$i]) ); last } } \$prev = \$ary->[\$i] } } ",
            "\$res ",
        ), "}",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION
