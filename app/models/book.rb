class Book < ApplicationRecord

  has_one_attached :profile_image
  belongs_to :user


   validates :title, presence: true
   validates :body, presence: true, length: { maximum: 200 }


  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end



end
