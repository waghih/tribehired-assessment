module Post
  class << self
    def all
      response = HTTParty.get('https://jsonplaceholder.typicode.com/posts')
  
      JSON.parse(response.body)
    end
  
    def find_by_id(id)
      response = HTTParty.get("https://jsonplaceholder.typicode.com/posts/#{id}")
  
      JSON.parse(response.body)
    end
  end
end
