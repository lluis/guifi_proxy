class Initr::GuifiProxy < Initr::Klass
  unloadable
  #TODO: moure apt-get update a una classe common, es l'unic que
  # necessitem de package_manager
  @@adds_klasses = [ Initr::PackageManager ]
  self.accessors_for(%w( guifi_base_url guifi_node_number guifi_squid_realm guifi_squid_port guifi_squid_lan ))
  validates_presence_of :guifi_node_number, :guifi_squid_realm, :guifi_squid_port, :on => :update
  validates_format_of :guifi_squid_lan, :with => /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{2}$/, :allow_blank => true
  validates_format_of :guifi_squid_port, :with => /^[0-9]+$/

  def initialize(attributes=nil)
    super
    self.guifi_base_url    ||= "http://www.guifi.net"
    self.guifi_squid_realm ||= "Proxy federat de guifi.net"
    self.guifi_squid_port  ||= "3128"
    self.guifi_squid_lan   ||= ""
  end

end
