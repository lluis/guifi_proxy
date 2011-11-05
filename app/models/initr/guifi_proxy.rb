class Initr::GuifiProxy < Initr::Klass
  unloadable
  self.accessors_for(%w( guifi_base_url guifi_node_number guifi_squid_realm guifi_squid_port guifi_squid_lan guifi_squid_logformat ))
  validates_presence_of :guifi_node_number, :guifi_squid_realm, :guifi_squid_port, :on => :update
  validates_format_of :guifi_squid_lan, :with => /^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{2}$/, :allow_blank => true
  validates_format_of :guifi_squid_port, :with => /^[0-9]+$/

  def initialize(attributes=nil)
    super
    self.guifi_base_url        ||= "http://www.guifi.net"
    self.guifi_squid_realm     ||= "Proxy federat de guifi.net"
    self.guifi_squid_port      ||= "3128"
    self.guifi_squid_lan       ||= ""
    self.guifi_squid_logformat ||= "squid"
  end

end
