use inc::Module::Install;
RTx('RT-OnlineDocs');
version_from ('lib/RT/OnlineDocs.pm');
author('Jesse Vincent <jesse@bestpractical.com>');
abstract('Display RT API documentation online');

requires_rt('4.0.0');
perl_version('5.8.3');

requires('Pod::Simple::HTML');
requires('File::Basename');
requires('File::Find');
requires('File::Temp');
requires('File::Spec');
auto_install();

license('GPLv2');
WriteAll();
