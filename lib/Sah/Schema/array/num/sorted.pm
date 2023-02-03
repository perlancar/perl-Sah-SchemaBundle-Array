package Sah::Schema::array::num::sorted;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of sorted numbers',
    description => <<'_',

Use this schema if you want to accept an array of sorted numbers, i.e. `elem(i)
>= elem(i-1) for all i > 0`.

See also: `array::num::monotonically_increasing` and
`array::num::reverse_sorted` schemas.

_
    of => ['num', {req=>1}],
    prefilters => ['Array::check_elems_numeric_sorted'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not sorted"},
        {value=>[1, 2, 2], valid=>1},
        {value=>[1, 2.9, 3], valid=>1},
    ],
}];

1;
# ABSTRACT:
