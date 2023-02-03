package Sah::Schema::array::int::sorted;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of sorted integers',
    description => <<'_',

This is like the `array::num::sorted` schema except elements must be integers.

_
    of => ['int', {req=>1}],
    prefilters => ['Array::check_elems_numeric_sorted'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not monotonically increasing"},
        {value=>[1, 2, 2], valid=>1},
        {value=>[1, 2.9, 3], valid=>0, summary=>"Contains non-integers"},
        {value=>[1, 2, 3], valid=>1},
    ],
}];

1;
# ABSTRACT:
