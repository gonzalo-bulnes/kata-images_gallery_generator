module ImagesGallery

  SourceFileNotFoundError = Class.new(LoadError)
  TargetDirectoryNotFoundError = Class.new(LoadError)
  SourceFileInvalidError = Class.new(RuntimeError)
end
