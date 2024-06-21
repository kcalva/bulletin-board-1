# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Board < ApplicationRecord
  validates(:name,{:presence=>true,:uniqueness=>true})
  has_many(:posts)

  def active_posts_in_ascending_order
    posts.where("expires_on >= ?",Date.today).order(expires_on: :asc)
  end

  def expired_posts_in_ascending_order
    # posts.where("expires_on < ?",Date.today).order(:expires_on).reverse
    posts.where("expires_on < ?",Date.today).order(expires_on: :desc)
  end
end
