require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting guifi_proxy plugin for Initr'

Initr::Plugin.register :guifi_proxy do
  redmine do
    name 'guifi_proxy'
    author 'Ingent'
    description 'GuifiProxy plugin for initr'
    version '0.0.1'
    project_module :initr do
      permission :configure_guifi_proxy,
        { :guifi_proxy => [:configure] },
        :require => :member
    end
  end
  klasses 'guifi_proxy' => 'GuifiProxy node'
end
