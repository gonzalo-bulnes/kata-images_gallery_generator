Images Gallery Generator Kata
=============================

Generate a set of static HTML files from an XML representation of EXIF data so users can browse large collections of images.

Usage
-----

```bash
# Generate a gallery inside spec/tmp from the example source file
./bin/images_gallery generate spec/fixtures/works.xml spec/tmp

# Read usage intructions:
./bin/images_gallery help

# Open the images gallery automatically after it was generated
firefox $(./bin/images_gallery generate spec/fixtures/works.xml spec/tmp/)
```

Development
-----------

### Test suite

```bash
# Run the test suite
rake

# Run the acceptance test suite only (can be seen as a demo)
rake features
# Visit spec/tmp/index.html to browse the sample images
```

### Parser

The `ImageGallery::Source` relies on the **LibXML** SAX parser to extract the images described in the source XML file (e.g. [`works.xml`][example-source]). That parser is [known to be fast][libxml-benchmarks] and [memory-thrifty][sax-versus-dom].

  [example-source]: spec/fixtures/works.xml
  [libxml-benchmarks]: https://github.com/xml4r/libxml-ruby#performance
  [sax-versus-dom]: http://www.saxproject.org/event.html

License
-------

    Images Gallery Generator
    Copyright (C) 2015 Gonzalo Bulnes Guilpain

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
