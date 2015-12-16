class locale (
                $default_locale='en_US.UTF-8',
                $locales= [ 'en_US.UTF-8 UTF-8', 'es_ES.UTF-8 UTF-8' ],
              ) inherits params {

  validate_array($locales)
  validate_string($default_locale)

  Exec {
    path => '/usr/sbin:/usr/bin:/sbin:/bin',
  }

  file {'/var/lib/locales/supported.d/local':
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => join($locales,"\n"),
    notify => Exec['locale-gen'],
  }

  file {'/etc/default/locale':
    ensure => 'present',
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => "LANG=${default_locale}\n",
    notify => Exec['update locale'],
  }

  exec {'locale-gen':
    command => 'locale-gen',
    refreshonly => true,
    timeout => 1000,
    require => File[ ['/etc/default/locale', '/var/lib/locales/supported.d/local'] ]
  }

  exec { 'update locale':
    command => "update-locale",
    refreshonly => true,
    require => File[ ['/etc/default/locale', '/var/lib/locales/supported.d/local'] ]
  }


}
