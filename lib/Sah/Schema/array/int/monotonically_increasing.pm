package Sah::Schema::array::int::monotonically_increasing;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of integers with monotonically increasing elements',
    description => <<'_',

This is like the `array::num::monotonically_increasing` schema except elements
must be integers.

_
    of => ['int', {req=>1}],
    prefilters => ['Array::check_elems_numeric_monotonically_increasing'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 2, 2, 3], valid=>0, summary=>"Duplicate elements"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not monotonically increasing"},
        {value=>[1, 2.9, 3], valid=>0, summary=>"Contains a non-integer element"},
        {value=>[1, 2, 3], valid=>1},
    ],
}];

1;
# ABSTRACT:
