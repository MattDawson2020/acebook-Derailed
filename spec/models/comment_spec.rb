require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Creating comments' do

    it 'can create a comment' do
      comment = Comment.create(body: "Howdy")
      expect(comment.body).to eq("Howdy")
    end

    it 'comment has user and post ID' do
      user = User.create(name: 'user', email: 'user@email.com', password: 'user_password')
      post = Post.create(message: "What up")
      comment = Comment.create(body: "Howdy", user_id: user.id, post_id: post.id)

      expect(comment.user_id).to eq(user.id)
      expect(comment.post_id).to eq(post.id)
    end

  end

end
