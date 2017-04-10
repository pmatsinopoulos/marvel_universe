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

  def url_to_tcb
    'https://www.techcareerbooster.com/?utm_source=tcb_web_app&utm_medium=marvelu_web_app&utm_campaign=general'
  end
end
