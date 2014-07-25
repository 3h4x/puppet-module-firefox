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
#   Default x86_64
#   Choose x86_64 or i686
#
# [*language*]
#   Default en-GB
#   
# [*root_dir*]
#   Default /opt
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
  validate_re($::kernel, '^Linux$', 'This module will work only on linux. Moar to come')
#  case $::kernel {
#    'Linux': {
#    }
#    'Darwin': {
#      notice { 'mmm':
#        message => "mac rider here $::kernel",
#        
#      }
#    }
#  }

  validate_re($firefox::architecture, '^(x86_64|i686)$', 'Invalid architecture, choose x86_64 or i686')

  class { 'firefox::install': } ->
  class { 'firefox::config':  } ->
  Class['firefox']
}
