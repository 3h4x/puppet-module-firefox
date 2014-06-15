# == Class: firefox

class firefox::install inherits firefox::params {
  ensure_packages(['wget', 'bzip2'])
  wget::fetch { 'firefox download':
    source      => "http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${firefox::version}/linux-${firefox::architecture}/${firefox::language}/firefox-${firefox::version}.tar.bz2",
    destination => "${firefox::root_dir}/firefox-${firefox::version}.tar.bz2",
  }  

  exec { 'make firefox dir':
    command => "mkdir /opt/firefox-${firefox::version}",
    unless  => "test -d /opt/firefox-${firefox::version}",
    path    => ['/bin/', '/usr/bin'],
  }

  exec { 'extract firefox':
    command => "tar -jxf ${firefox::root_dir}/firefox-${firefox::version}.tar.bz2 -C ${firefox::root_dir}/firefox-${firefox::version} --strip-components 1",
    unless  => "test -f ${firefox::root_dir}/firefox-${firefox::version}/firefox",
#    cwd     => $firefox::root_dir,
    path    => ['/bin/', '/usr/bin'],
  }

#  exec { 'remove firefox archive':
#    command => "rm ${firefox::root_dir}/${firefox::version}.tar.bz2",
#    onlyif  => "test -f ${firefox::root_dir}/${firefox::version}.tar.bz2",
#    cwd     => $firefox::root_dir,
#    path    => ['/bin/', '/usr/bin'],
#  }
  
  file { 'symlink firefox':
    ensure => link,
    path   => '/opt/firefox/',
    target => "${firefox::root_dir}/firefox-${firefox::version}/",
  }

  file { '/usr/share/applications/firefox.desktop':
    ensure  => present,
    source  => 'puppet:///modules/firefox/firefox.desktop',
    require => File['symlink firefox'],
  }
  
  file { "/opt/firefox/icons/firefox.png":
    ensure  => present,
    source  => 'puppet:///modules/firefox/firefox.png',
    require => File['symlink firefox'],
  }

Wget::Fetch['firefox download'] -> 
Exec['make firefox dir'] ->
Exec['extract firefox'] ->
File['symlink firefox'] ->
File['/usr/share/applications/firefox.desktop'] ->
File['/opt/firefox/icons/firefox.png']

}
