module ApplicationHelper
  def active_nav(controller)
    controller_name == controller ? 'active' : ''
  end
end
