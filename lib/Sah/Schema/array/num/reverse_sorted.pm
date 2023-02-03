package Sah::Schema::array::num::reverse_sorted;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of reversely sorted numbers',
    description => <<'_',

Use this schema if you want to accept an array of reversely sorted numbers, i.e.
`elem(i) <= elem(i-1) for all i > 0`.

See also: `array::num::monotonically_decreasing` and
`array::num::sorted` schemas.

_
    of => ['num', {req=>1}],
    prefilters => ['Array::check_elems_numeric_reverse_sorted'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not reversely sorted"},
        {value=>[2, 2, 1], valid=>1},
        {value=>[3, 2.9, 1], valid=>1},
    ],
}];

1;
# ABSTRACT:
