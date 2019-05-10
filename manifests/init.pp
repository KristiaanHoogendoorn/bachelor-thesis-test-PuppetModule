class webserver (
$package,
){
package { $package:
  ensure => present,
}
file {'/etc/webserver/':
  ensure => directory,
}
file {'/var/www/index.html':
  ensure => file,
  require => Package[$package],
}
service { $package:
  ensure => running,
  enable => true,
}
}
