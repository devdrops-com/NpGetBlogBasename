use strict;
use lib qw( t/lib lib extlib );
use warnings;
use MT;
use Test::More tests => 5;
use MT::Test;

ok(MT->component ('NpGetBlogBasename'), "NpGetBlogBasename plugin loaded correctry");

require_ok('NpGetBlogBasename::L10N');
require_ok('NpGetBlogBasename::L10N::ja');
require_ok('NpGetBlogBasename::L10N::en_us');
require_ok('NpGetBlogBasename::Tags');

1;
