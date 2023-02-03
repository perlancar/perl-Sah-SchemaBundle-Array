package Sah::Schema::array::int::contiguous;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of a single contiguous range of integers',
    description => <<'_',

_
    of => ['int', {req=>1}],
    prefilters => ['Array::check_elems_int_contiguous'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 2, 4], valid=>0, summary=>"Not contiguous"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not sorted"},
        {value=>[1], valid=>1},
        {value=>[1, 2, 3], valid=>1},
        {value=>[1.1, 2.1], valid=>0, summary=>"Contains non-integers"},
    ],
}];

1;
# ABSTRACT:
