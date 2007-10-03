use inc::Module::Install;
RTx('RT-OnlineDocs');
version_from ('lib/RT/OnlineDocs.pm');
author('Jesse Vincent <jesse@bestpractical.com>');
abstract('Display RT API documentation online');

requires('Pod::Simple::HTML');
requires('File::Basename');
requires('File::Find');
requires('File::Temp');
requires('File::Spec');
auto_install();

license('GPLv2');
WriteAll();
