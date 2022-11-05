class User < ApplicationRecord
 has_many :comments 
 has_many :posts
 has_many :likes

 def three_recent_posts  
  user.posts.last(3)
 end

end
