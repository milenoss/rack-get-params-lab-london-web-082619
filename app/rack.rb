class Application 
    @@items =["Apples","Carrots","Pears"]
    @@cart = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

    if req.path.match(/items/) 
    @@items.each do|item| 
        resp.write "#{item}\n" end
    
    elsif req.path.match(/search/)
        search_term = req.params["q"]
        resp.write handle_search[search_term]
    elsif req.path.match(/cart/)
        if @@cart.empty? 
            resp.write "Your cart is empty"
        else 
        @@cart.each{|item|
        resp.write "#{item}\n"} 
        end
    elsif req.path.match(/add/)
        add_items = req.params["item"]
        if @@items.include?(add_items)
            @@cart << add_items
            resp.write "added #{add_items}"
        else 
            resp.write"We dont have that item
        end
    else
        resp.write "Path Not Found" 
    end
    resp.finish
end

def handle_search(search_term) 
    if @@item
        
    }   