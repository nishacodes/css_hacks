class Entry
  attr_accessor :id, :title, :css, :html_render, :html_display

  def initialize(id, title)
    @id = id
    @title = title
  end

end