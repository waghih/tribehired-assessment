# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::CommentsController, type: :request do
  path '/api/comments/search' do
    get 'Search comments' do
      tags 'Comment'
      produces 'application/json'
      parameter name: :name, in: :query, type: :string, required: false
      parameter name: :email, in: :query, type: :string, required: false
      parameter name: :body, in: :query, type: :string, required: false

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
        }
      ].to_json

      response '200', 'Return search result' do
        before do
          stub_request(:get, 'https://jsonplaceholder.typicode.com/comments')
            .to_return(body: mock_comments_response)
        end

        let(:name) { 'dolorem' }

        run_test! do
          expect(json[0]['postId']).to eq(2)
        end
      end
    end
  end
end
