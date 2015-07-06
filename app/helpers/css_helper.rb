module CssHelper
  # Return: "font-size: 0.5em;"
  # font_size_base is in em
  # 6.5 px per character
  def long_string_font_resize(string, target_width:, base_size: 1, upsize: false)
    width_per = base_size * 6.5
    font_size = ( target_width / ( string.size * width_per ) ).round(3)

    if ( font_size > base_size && upsize ) \
    || ( font_size < base_size )
      "font-size: #{font_size}em;"
    else
      "font-size: #{base_size}em;"
    end
  end

  def sized_tag(tag, str, width, base_size: nil, upsize: nil)
    params = { style: long_string_font_resize( str, target_width: width, base_size: base_size, upsize: upsize ) }
    content_tag( tag, str, params )
  end
end
