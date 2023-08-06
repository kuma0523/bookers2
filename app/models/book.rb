class Book < ApplicationRecord

  has_one_attached :image

  belongs_to :user


  def get_image

    if image.attached?

      image

    else

      'no_image.jap'

    end

  end


  def get_profile_image(width, height)


    unless profile_image.attached?

      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')

      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

    end

    profile_image.variant(resize_to_limit: [100, 100]).processed

  end

end