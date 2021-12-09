module Comment
  class << self
    def all
      response = HTTParty.get('https://jsonplaceholder.typicode.com/comments')

      JSON.parse(response.body)
    end
  end
end
