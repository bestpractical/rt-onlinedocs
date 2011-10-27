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

sub lib_paths {
    my $dirname   = "$RT::BasePath/lib";
    my $localdir  =  $RT::LocalLibPath;
    my $plugindir =  $RT::LocalPluginPath;

    # We intentionally don't use the plugins API, as this also gets us
    # plugins that are not currently enabled
    my @plugins = ();
    if(opendir(PLUGINS, $plugindir)) {
        while(defined(my $plugin = readdir(PLUGINS))) {
            next if($plugin =~ /^\./);
            push(@plugins, "$plugindir/$plugin/lib");
        }
        closedir(PLUGINS);
    }

    return ($dirname, $localdir, @plugins);
}

1;
