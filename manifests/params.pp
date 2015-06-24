# == Class: firefox::params
#
# Defaut parameter values for the firefox module
#

class firefox::params inherits firefox::dependencies {
  $version          = '37.0.2'
  $ensure           = present
  $language         = 'en-GB'
  $root_dir         = '/opt'
  $architecture     = $::hardwaremodel
}
