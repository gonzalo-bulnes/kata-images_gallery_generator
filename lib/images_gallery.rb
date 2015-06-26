require 'images_gallery/generator'
require 'images_gallery/version'

class String

  # Sanitize a name so it can be used as part of an URL
  def to_filename
    downcase.gsub(/\W/, '_').gsub(/_+/, '_').gsub(/_\Z/, '')
  end
end
