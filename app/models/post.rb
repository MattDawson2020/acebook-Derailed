class Post < ApplicationRecord

  has_one_attached :post_image

  def self.like(postId)
    post = Post.find_by(id: postId)
    post.update(likes: (post.likes + 1))
  end
end
