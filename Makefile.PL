use inc::Module::Install;
RTx('RT-OnlineDocs');
readme_from ('lib/RT/OnlineDocs.pm');
all_from ('lib/RT/OnlineDocs.pm');

requires_rt('4.0.0');
perl_version('5.8.3');

requires('Pod::Simple::HTML');
requires('File::Basename');
requires('File::Find');
requires('File::Temp');
requires('File::Spec');
auto_install();

license('GPLv2');
sign();
WriteAll();
