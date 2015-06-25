module ImagesGallery
  class Image

    attr_accessor :id, :src, :make, :model

    def make
      @make || 'Other'
    end

    def model
      @model || 'Other'
    end

    def description
      "Image #{@id}"
    end

  end
end
