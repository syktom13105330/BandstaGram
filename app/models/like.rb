class Like < ApplicationRecord
    belongs_to :post_detail
    validates :user_id, {presence: true}
    validates :post_detail_id, {presence: true}
end
