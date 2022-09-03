class Post < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :price, presence: true
  validates :star, presence: true
  validates :price, presence: true
  validates :introduction, presence: true
  validates :genre, presence: true

  has_one_attached :image
  belongs_to :member
  has_many :comments, dependent: :destroy
  belongs_to :genre

  def get_image
   unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
   else
    image
   end
  end

  def self.search(keyword)
    where(["item_name like?", "%#{keyword}%"])
  end
end