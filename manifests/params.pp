# == Class: firefox::params
#
# Defaut parameter values for the firefox module
#

class firefox::params {
  $version          = '36.0.4'
  $ensure           = present
  $language         = 'en-GB'
  $root_dir         = '/opt'
  $architecture     = $::hardwaremodel
}
