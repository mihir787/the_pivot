class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_photo(photo_id)
    contents[photo_id.to_s] ||= 0
    contents[photo_id.to_s] += 1
  end

  def count_all
    contents.values.sum
  end

  def find_photos
    contents.keys.map { |photo_id| Photo.find(photo_id)}
  end

  def find_valid_photos
    photos = subtotal.reject { |_id, total| total == 0}
    photos.keys.map { |photo_id| Photo.find(photo_id)}
  end

  def subtotal
    find_photos.each_with_object({}) do |photo, hash|
      hash[photo.id] = photo.price
    end
  end

  def total
    subtotal.values.sum
  end

  def remove_photo(photo_id)
    contents.delete(photo_id)
  end

  def create_order_photos(order_id)
    contents.find_photos.each do
      OrderPhotos.new()
    end
  end

  def clear
    contents.clear
  end
end
