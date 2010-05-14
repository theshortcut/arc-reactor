%w(compass sinatra sinatra/cache haml sass coffee-script).each{|lib| require lib}

class App < Sinatra::Base

  set :haml, { :format => :html5 }
  set :root, File.dirname(__FILE__)
  set :public, File.dirname(__FILE__) + '/static'

  register(Sinatra::Cache)

  set :cache_enabled, true
  set :cache_environment, :development

  configure do
    Compass.add_project_configuration(File.join(self.root, 'config', 'compass.config'))
  end

  helpers do
    def p_(page)
      haml ('_'+page.to_s).to_sym, :layout => false
    end
  end

  get '/' do
    cache_expire '/'
    haml :index
  end

  get '/:pagename.html' do
    cache_expire "/#{params[:pagename]}.html"
    haml params[:pagename].to_sym
  end

  get '/p/:pagename.html' do
    cache_expire "/p/#{params[:pagename]}.html"
    p_ params[:pagename].to_sym
  end


  get '/stylesheets/:name.css' do
    cache_expire "/stylesheets/#{params[:name]}.css"
    content_type 'text/css', :charset => 'utf-8'
    sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
  end

  get '/coffee/:name.js' do
    content_type :js
    file = File.new( File.join( options.public, 'coffee', "#{params[:name]}.js" ), "w+" )
    file.write CoffeeScript.compile File.read(File.join( options.views, 'coffee', "#{params[:name]}.coffee" ))
    file.close
  end

end
