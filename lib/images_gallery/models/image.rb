module ImagesGallery
  module Models
  class Image

    attr_accessor :id, :src, :make, :model

    def make
      @make || 'Unknown Make'
    end

    def model
      @model || 'Unknown Model'
    end

    def description
      "Image #{@id}"
    end

  end
  end
end
