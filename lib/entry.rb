class Entry
  attr_accessor :id, :title, :css, :html

  def initialize(id, title)
    @id = id
    @title = title
    @css = ""
    @html = ""
  end

end