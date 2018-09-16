class Application

  @@items = ([Item.new("Figs",3.42),Item.new("Pears",0.99)])

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      item = @@items.find{|element| element.name == item_title}

      resp.write item.price

    else
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status=404
        resp.write "Route not found"
      end

    resp.finish
  end




end
