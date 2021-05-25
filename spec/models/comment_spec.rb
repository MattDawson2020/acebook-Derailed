require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Creating comments' do
    let(:user) { User.create(name: 'user', email: 'user@email.com', password: 'user_password') }
    let(:post) { Post.create(message: "What up", user_id: user.id) }

    it 'can create a comment' do
      Comment.create(body: "Howdy", user_id: user.id, post_id: post.id)
      comment = Comment.all.first
      expect(comment.body).to eq("Howdy")
    end

    it 'comment has user and post ID' do
      Comment.create(body: "Howdy", user_id: user.id, post_id: post.id)
      comment = Comment.all.first

      expect(comment.user_id).to eq(user.id)
      expect(comment.post_id).to eq(post.id)
    end

  end

end
