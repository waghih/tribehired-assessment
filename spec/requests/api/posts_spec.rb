# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do
  path '/api/posts/top' do
    get 'Top posts with total number of comments' do
      tags 'Post'
      produces 'application/json'

      mock_comments_response = [
        {
          postId: 1,
          id: 1,
          name: "id labore ex et quam laborum",
          email: "Eliseo@gardner.biz",
          body: "laudantium enim quasi est quidem magnam voluptate ipsam eos tempora quo necessitatibus dolor quam autem quasi reiciendis et nam sapiente accusantium"
        },
        {
          postId: 1,
          id: 2,
          name: "quo vero reiciendis velit similique earum",
          email: "Jayne_Kuhic@sydney.com",
          body: "est natus enim nihil est dolore omnis voluptatem numquam et omnis occaecati quod ullam at voluptatem error expedita pariatur nihil sint nostrum voluptatem reiciendis et"
        },
        {
          postId: 2,
          id: 6,
          name: "et fugit eligendi deleniti quidem qui sint nihil autem",
          email: "Presley.Mueller@myrl.com",
          body: "doloribus at sed quis culpa deserunt consectetur qui praesentium accusamus fugiat dicta voluptatem rerum ut voluptate autem voluptatem repellendus aspernatur dolorem in"
        },
        {
          postId: 2,
          id: 7,
          name: "repellat consequatur praesentium vel minus molestias voluptatum",
          email: "Dallas@ole.me",
          body: "maiores sed dolores similique labore et inventore et quasi temporibus esse sunt id et eos voluptatem aliquam aliquid ratione corporis molestiae mollitia quia et magnam dolor"
        },
        {
          postId: 2,
          id: 8,
          name: "et omnis dolorem",
          email: "Mallory_Kunze@marie.org",
          body: "ut voluptatem corrupti velit ad voluptatem maiores et nisi velit vero accusamus maiores voluptates quia aliquid ullam eaque"
        },
        {
          postId: 2,
          id: 9,
          name: "provident id voluptas",
          email: "Meghan_Littel@rene.us",
          body: "sapiente assumenda molestiae atque adipisci laborum distinctio aperiam et ab ut omnis et occaecati aspernatur odit sit rem expedita quas enim ipsam minus"
        },
        {
          postId: 3,
          id: 11,
          name: "fugit labore quia mollitia quas deserunt nostrum sunt",
          email: "Veronica_Goodwin@timmothy.net",
          body: "ut dolorum nostrum id quia aut est fuga est inventore vel eligendi explicabo quis consectetur aut occaecati repellat id natus quo est ut blanditiis quia ut vel ut maiores ea"
        }
      ].to_json

      mock_posts_requests = [
        {
          userId: 1,
          id: 1,
          title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
          body: "quia et suscipit suscipit recusandae consequuntur expedita et cum reprehenderit molestiae ut ut quas totam nostrum rerum est autem sunt rem eveniet architecto"
        },
        {
          userId: 1,
          id: 2,
          title: "qui est esse",
          body: "est rerum tempore vitae sequi sint nihil reprehenderit dolor beatae ea dolores neque fugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis qui aperiam non debitis possimus qui neque nisi nulla"
        },
        {
          userId: 1,
          id: 3,
          title: "ea molestias quasi exercitationem repellat qui ipsa sit aut",
          body: "et iusto sed quo iure voluptatem occaecati omnis eligendi aut ad voluptatem doloribus vel accusantium quis pariatur molestiae porro eius odio et labore et velit aut"
        }
      ].to_json

      response '200', 'list of Top Posts ordered by their number of Comments' do
        before do
          stub_request(:get, 'https://jsonplaceholder.typicode.com/comments')
            .to_return(body: mock_comments_response)
  
          stub_request(:get, 'https://jsonplaceholder.typicode.com/posts')
            .to_return(body: mock_posts_requests)
        end

        run_test! do
          expect(json[0]["post_id"]).to eq(2)
          expect(json[1]["post_id"]).to eq(1)
          expect(json[2]["post_id"]).to eq(3)
        end
      end
    end
  end
end
