# frozen_string_literal: true

module Api
  class PostsController < ApiController
    def top
      all_comments = Comment.all
      all_posts = Post.all

      each_post_comments_count = all_comments.map do |comment|
        comment['postId']
      end.tally

      posts_with_comments_total_number = all_posts.map do |post|
        post_id = post['id']
        {
          post_id: post['id'],
          post_title: post['title'],
          post_body: post['body'],
          total_number_of_comments: each_post_comments_count[post_id]
        }
      end

      top_posts = posts_with_comments_total_number.sort_by do |obj|
        obj[:total_number_of_comments]
      end.reverse

      render json: top_posts, status: :ok
    end
  end
end
