class Book < ApplicationRecord

  has_one_attached :image

  belongs_to :user


  def get_image

    if image.attached?

      image

    else

      'no_image.jpg'

    end

  end



  def get_image

    unless image.attached?

      file_path = Rails.root.join('app/assets/images/no_image.jpg')

      image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

    end

    image

  end


  # def get_image

  #   if image.attached?

  #     image

  #   else

  #     'no_image.jap'

  #   end

  # end


  # def get_user_image(width, height)


  #   unless get_user_image.attached?

  #     file_path = Rails.root.join('app/assets/images/sample-author1.jpg')

  #     get_user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')

  #   end

  #   get_user_image.variant(resize_to_limit: [100,100]).processed

  # end

end
