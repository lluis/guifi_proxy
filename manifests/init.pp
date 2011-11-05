class guifi_proxy {

  include common::squid
  include common::apt

  file {
    "/etc/apt/sources.list.d/guifi.list":
      content => "deb http://repo.vic.guifi.net/debian/ ./",
      notify => Exec["apt-get update"];
    "/etc/guifi-proxy/config.sh":
      content => template("guifi_proxy/config.sh.erb"),
      require => Package["guifi-proxy"];
    "/etc/squid/squid.conf":
      content => template("guifi_proxy/squid.conf.erb"),
      require => Package["guifi-proxy"],
      notify => Service["squid"];
  }

  package {
    "guifi-proxy":
      ensure => latest,
      require => File["/etc/apt/sources.list.d/guifi.list"];
  }

}
