class User < ActiveRecord::Base
  has_many :posts, :dependent=> :destroy

  has_many :user_groups, :dependent=> :destroy
  has_many :groups, :through=> :user_groups
end
