class firefox::dependencies {
  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-lambda-epll':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/firefox/RPM-GPG-KEY-lambda-epll',
  }
  file { '/etc/yum.repos.d/epll.repo':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/firefox/epll.repo',
    require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-lambda-epll'],
  }
  file { '/etc/yum.repos.d/epll-preview.repo':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/firefox/epll-preview.repo',
    require => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-lambda-epll'],
  }
  package { 'firfox-compat':
    ensure  => installed,
    require => File['/etc/yum.repos.d/epll.repo'],
  }
}
