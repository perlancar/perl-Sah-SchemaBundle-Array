package Sah::SchemaBundle::Array;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

1;
# ABSTRACT: Sah schemas related to array type

=head1 DESCRIPTION

The L<Sah>'s C<array> type supports some basic constraint clauses: C<min_len>,
C<max_len>, C<len>, C<len_between> (for checking number of elements), C<uniq>
(for checking that elements are unique), C<has> (for checking that a specified
value is found in array).

Until L<Data::Sah> allows easier creation of custom clauses, this distribution
contains schemas that allow you to perform additional checks.


=head1 prepend:SEE ALSO

L<Sah::PSchemaBundle::Array>

L<Sah::SchemaBundle::Hash>
