require 'bundler'
Bundler.require
require './lib/entry.rb'


module Something
  class App < Sinatra::Application
    
   
   
    get '/' do
      @hack = Entry.new(1,"FLIP EFFECT")
      @hack.css = "
.flip-container {
  position:absolute;
  left:50%;
  top:50%;
  margin-top:-100px;
  margin-left:-100px;
  -webkit-perspective:1200;
  -moz-perspective:1200;
  perspective:1200;
}
.flip-container:hover .creation {
  -webkit-transform:rotateY(180deg);
  -moz-transform:rotateY(180deg);
}
.creation {
  width:200px;
  height:200px;
  float:left;
  -webkit-transition:all 0.6s;
  -moz-transition:all 0.6s;
  transition:all 0.6s;
  -webkit-transform-style:preserve-3d;
  -moz-transform-style:preserve-3d;
  transform-style:preserve-3d;
}
.front, .back {
  position:absolute;
  top:0;
  left::0;
  -webkit-backface-visibility:hidden;
  -moz-backface-visibility:hidden;
  backface-visibility:hidden;
}
.back {
  z-index:800;
  -webkit-transform:rotateY(-180deg);
  -moz-transform:rotateY(-180deg);
  transform:rotateY(-180deg);
}
.creation p {
  color:#666;
  display:block;
  width:auto;
  text-align:center;
  line-height:184px;
  margin:0 30px;
  font-size:20px;
  text-transform:uppercase;
  text-shadow:1px 1px 1px #999;
  font-family:sans-serif;
}
.creation p span {
  vertical-align:middle;
  display:inline-block;
  line-height:1.4;
}
.cont {
  border-radius:50%;
  background-color:#ddd;
  width:184px;
  height:184px;
  display:inline-block;
}"
      @hack.html_display = "
&lt;div class='flip-container'&gt;
  &lt;div class='creation'&gt;
    &lt;div class='front'&gt;
      &lt;div class='cont'&gt;
        &lt;p&gt;
          &lt;span class='details'&gt;Front&lt;/span&gt;
        &lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class='back'&gt;
      &lt;div class='cont'&gt;
        &lt;p&gt;
          &lt;span class='details'&gt;Back&lt;/span&gt;
        &lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;"
      @hack.html_render = "<div class='flip-container'>
  <div class='creation'>
    <div class='front'>
      <div class='cont'>
        <p>
          <span class='details'>Front</span>
        </p>
      </div>
    </div>
    <div class='back'>
      <div class='cont'>
        <p>
          <span class='details'>Back</span>
        </p>
      </div>
    </div>
  </div>
</div>"
      @result_class = "css#{@hack.id}"
      erb :index
    end

    post '/:id' do
      @hack = Entry.new(params[:id],"#{params["title"]}")
      @hack.css = params["css"]
      @hack.html_render = params["html"]
      @hack.html_display = @hack.html_render.gsub("<","&lt;").gsub(">","&gt;")
      erb :index
    end

    helpers do 
      def simple_partial(template)
        erb template
      end
    end

  end
end

# TO DO
# incorporate database and have id numbers increment 
# save entries to the database
# style the form
# figure out how to link to any part of the carousel with ID
# responsive styling 
# ruby cycle through each hack for each slide
