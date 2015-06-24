Images Gallery Generator Kata
=============================

Generate a set of static HTML files from an XML representation of EXIF data so users can browse a collection of images.

Usage
-----

```bash
# Generate a gallery inside spec/tmp from the example source file
./bin/images_gallery generate spec/fixtures/works.xml spec/tmp

# Read usage intructions:
./bin/images_gallery help
```

Development
-----------

### Test suite

```bash
# Run the test suite
rake
```

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
