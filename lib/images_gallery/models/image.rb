module ImagesGallery
  module Models
    class Image

      attr_accessor :id, :iso, :make, :model, :src

      def description
        "Image #{@id}"
      end

      def iso
        @iso || 'Unknown ISO speed rating'
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
