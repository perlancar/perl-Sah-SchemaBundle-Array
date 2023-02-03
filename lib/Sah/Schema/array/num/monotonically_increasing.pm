package Sah::Schema::array::num::monotonically_increasing;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'An array of numbers with monotonically increasing elements',
    description => <<'_',

Use this schema if you want to accept an array of numbers where the elements are
monotonically increasing, i.e. `elem(i) > elem(i-1) for all i > 0`. It's similar
to the `array::num::sorted` schema except that duplicate numbers are not allowed
(e.g. `[1, 2, 2, 4]` is okay for `array::num::sorted` but will fail
`array::num::monotonically_increasing`).

_
    of => ['num', {req=>1}],
    prefilters => ['Array::check_monotonically_increasing_numeric_elems'],
    examples => [
        {value=>{}, valid=>0, summary=>"Not an array"},
        {value=>[], valid=>1},
        {value=>[1, "a"], valid=>0, summary=>"Contains a non-numeric element"},
        {value=>[1, undef], valid=>0, summary=>"Contains an undefined element"},
        {value=>[1, 2, 2, 3], valid=>0, summary=>"Duplicate elements"},
        {value=>[1, 3, 2], valid=>0, summary=>"Not monotonically increasing"},
        {value=>[1, 2.9, 3], valid=>1},
    ],
}];

1;
# ABSTRACT:
