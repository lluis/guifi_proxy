class GuifiProxyController < InitrController
  unloadable

  menu_item :initr

  before_filter :find_guifi_proxy
  before_filter :authorize

  def configure
    @html_title=[@node.fqdn, @klass.name]
    if request.post?
      params["guifi_proxy"] ||= {}
      if @klass.update_attributes(params["guifi_proxy"])
        flash[:notice]='Configuration saved'
        redirect_to :controller => 'klass', :action => 'list', :id => @node
      else
        render :action=>'configure'
      end
    end
  end

  private

  def find_guifi_proxy
    @klass = Initr::GuifiProxy.find params[:id]
    @node = @klass.node
    @project = @node.project
  end

end
