# app/helpers/links_helper.rb
module LinksHelper
  include ActionView::Helpers

  def custom_link(text, url)
    link_to(text, url, class: 'custom-link')
  end

    # In your view or helper
  def build_query_string(params)
    params.map { |key, value| "#{key}=#{value}" }.join('&')
  end

end
