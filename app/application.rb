class Application

  @@items = ([Item.new("Figs",3.42),Item.new("Pears",0.99)])

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|element| element.title == item_title}

      resp.write item
    
    else
      resp.write "404"
    end

    resp.finish
  end




end
