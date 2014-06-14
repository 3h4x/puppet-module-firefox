# == Class: firefox
#
# Module to install and configure firefox in OS
#
# === Parameters
#
# [*version*]
#   version of firefox to install
#
# [*ensure*]
#   Default present
#   If absent removes firefox folder and links to it
#
# [*architecture*]
#   Default linux-x86_64
#   Choose 64 (linux-x86_64) or 32 (linux-i686)
#
# [*language*]
#   Default en-GB
#   
# [*root_dir*]
#   Default /opt/firefox
#   Where to put firefox installation
#
# === Authors
#
# h4x <ochach@gmail.com>
#
# === Copyright
#
# Copyright 2014 h4x
#

class firefox(
  $version          = $firefox::params::version,
  $ensure           = $firefox::params::ensure,
  $architecture     = $firefox::params::architecture,
  $language         = $firefox::params::language,
  $root_dir         = $firefox::params::root_dir,
  $extra_parameters = undef,
) inherits firefox::params {
  validate_re($::osfamily, '^(Debian|Ubuntu)$', 'This module was tested on Debian and Ubuntu only. Moar to come')

  class { 'firefox::install': } ->
  class { 'firefox::config':  } ->
  Class['firefox']
}
