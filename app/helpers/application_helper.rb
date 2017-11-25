module ApplicationHelper
  def login_helper style = ''
    if current_user
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else 
      (link_to "Register", new_user_registration_path, class: style) +  
      (link_to "Login", new_user_session_path, class: style) 
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout" 
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_path,
        title: "About Me"
        },
      {
        url: contact_path,
        title: "Contact"
        },
      {
        url: blogs_path,
        title: "Blog"
        },
      {
        url: portfolios_path,
        title: "Portfolio"
        },
    ]
  end

  def nav_helper style, tag_type

    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a class='#{style} #{active? item[:url]}' href='#{item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe   

  end

  def active? path
    "active" if current_page? path
  end
end
