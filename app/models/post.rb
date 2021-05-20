class Post < ApplicationRecord
  def self.like(postId)
    post = Post.find_by(id: postId)
    post.update(likes: (post.likes + 1))
  end
end
