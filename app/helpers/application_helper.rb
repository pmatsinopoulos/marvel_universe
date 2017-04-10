module ApplicationHelper
  def top_menu_active(menu_item_text)
    if controller_name == 'public' && action_name == 'index'
      if menu_item_text == 'Home'
        return 'active'
      end
    end

    if controller_name == 'characters' && action_name == 'index'
      if menu_item_text == 'Characters'
        return 'active'
      end
    end
  end
end
