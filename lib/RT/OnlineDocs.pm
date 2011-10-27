=head1 NAME

RT-OnlineDocs - Provides a browseable interface to the developer documentation

=head1 DESCRIPTION

RT::OnlineDocs adds a "Developer Documentation" menu to the RT user interface.
This tool provides a browsable user interface to the RT API documentation for
the running RT instance. I'm indebted to Audrey Tang who contributed the
first version of this code.

=head1 INSTALLATION

=over

=item perl Makefile.PL

=item make

=item make install

May need root permissions

=item Edit your /opt/rt4/etc/RT_SiteConfig.pm

Add this line:

    Set(@Plugins, qw(RT::OnlineDocs));

or add C<RT::OnlineDocs> to your existing C<@Plugins> line.

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

Jesse Vincent - <jesse@bestpractical.com>
Audrey Tang - <audreyt@audreyt.org>

=head1 LICENCE AND COPYRIGHT

This software is copyright (c) 1996-2011 by Best Practical Solutions.

This module is free software; you can redistribute it and/or
modify it under the terms of version 2 of the GNU General Public License.

=cut

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
