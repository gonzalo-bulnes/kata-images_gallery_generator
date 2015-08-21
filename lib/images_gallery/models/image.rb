module ImagesGallery
  module Models
    class Image

      attr_accessor :id, :make, :model, :src

      def description
        "Image #{@id}"
      end

      def make
        @make || 'Unknown Make'
      end

      def model
        @model || 'Unknown Model'
      end

    end
  end
end
