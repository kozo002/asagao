class ProductImage < Image
  has_many :attachments,
    class_name: 'ImageAttachment',
    dependent: :destroy,
    foreign_key: :image_id

  has_many :products,
    through: :attachments
end
