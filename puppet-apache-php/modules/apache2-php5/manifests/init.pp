class apache2-php5 {

package { 'apache2':  
 ensure => installed
}
# Asentaa apachen

service { 'apache2':
ensure => running,
require => Package["apache2"]
}
 
 exec { "userdir":
        notify => Service["apache2"],
        command => "/usr/sbin/a2enmod userdir",
        require => Package["apache2"],
    }
 
 package { 'php5':
  ensure => installed
}

file {'/etc/apache2/mods-enabled/php5.conf':
ensure => file,
content => template ('apache2-php5/php5.erb')
}
}
