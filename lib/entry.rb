class Entry
  attr_accessor :id, :title, :css, :html_render, :html_display

  def initialize(id, title, html, css)
    @id = id
    @title = title
    @html_render = html
    @css = css
    @html_display = @html_render.gsub("<","&lt;").gsub(">","&gt;")
  end

  
end