class Hack
  include DataMapper::Resource
  property :id, Serial
  property :title, String, :required => true
  property :html, Text
  property :html_display, Text
  property :css, Text
  property :created_at, DateTime
  property :updated_at, DateTime
  test

  before :save, :format_html
 
  def format_html
    @html_display = @html.gsub("<","&lt;").gsub(">","&gt;")
  end

  # attr_accessor :id, :title, :css, :html_render, :html_display

  # def initialize(id, title, html, css)
  #   @id = id
  #   @title = title
  #   @html_render = html
  #   @css = css
  #   @html_display = @html_render.gsub("<","&lt;").gsub(">","&gt;")
  # end
end