# frozen_string_literal: true

module Api
  class CommentsController < ApiController
    def search
      all_comments = Comment.all

      search_result = all_comments.select do |comment|
        condition = []
        for field in search_fields do
          condition.push(comment[field].downcase.include?(search_params[field.to_sym].downcase))
        end
        condition.all?
      end.flatten

      render json: search_result, status: :ok
    end

    private

    def search_params
      params.except(:format).permit(%i[name email body])
    end

    def search_fields
      search_params.keys
    end
  end
end
