# Copyright 1996-2008 Best Practical Solutions, LLC
#

use strict;
use warnings;

package RT::OnlineDocs;

require File::Basename;
require File::Find;
require File::Temp;
require File::Spec;
require Pod::Simple::HTML;

our $VERSION = "0.10";

1;
