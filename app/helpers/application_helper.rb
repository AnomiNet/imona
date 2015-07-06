module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def header(header_text)
    content_for(:header) { header_text }
  end

  # e.g. "Top"
  def nav(active_nav_item)
    content_for(:nav) { active_nav_item }
  end

  def nav_link(text, path)
    link_to( text, root_path, class: "#{text} #{ 'active' if text == content_for(:nav) }" )
  end
end
