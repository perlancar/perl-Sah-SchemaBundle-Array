package Data::Sah::Filter::perl::Array::check_elems_int_contiguous;

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
        summary => "Check that elements of array are a contigous range of integers",
        examples => [
            {value=>{}, valid=>0, summary=>"Not an array"},
            {value=>[], valid=>1},
            {value=>[1, 2, 4], valid=>0, summary=>"Not contiguous"},
            {value=>[1, 3, 2], valid=>0, summary=>"Not sorted"},
            {value=>[1.1, 2.1], valid=>0, summary=>"Contains non-integers"},
            {value=>[1], valid=>1},
            {value=>[2,3,4], valid=>1},
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
            "if (\$ref ne 'ARRAY') { \$res->[0] = 'Not an array' ",
            "} else { ", (
                "for my \$i (0 .. \$#{\$ary}) { if (\$i > 0) { if (\$prev + 1 != \$ary->[\$i]) { \$res->[0] = qq(Elements not contiguous (check element[\$i]) ); last } } \$prev = \$ary->[\$i]; if (\$prev != int(\$prev)) { \$res->[0] = qq(Contain non-integer (check element[\$i])) ; last } } } ",
            ),
            "\$res ",
        ), "}",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$

=head1 DESCRIPTION
