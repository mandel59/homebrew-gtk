require 'formula'

class Clutter < Formula
  homepage 'https://wiki.gnome.org/Clutter'
  url 'http://ftp.gnome.org/pub/gnome/sources/clutter/1.14/clutter-1.14.4.tar.xz'
  sha256 'c996d91fff6fff24d9e23dcd545439ebc6b999fb1cf9ee44c28ca54c49c0ee1c'

  option 'without-quartz', 'Build without Quartz support'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'glib'
  depends_on 'gdk-pixbuf'
  depends_on 'cogl'
  depends_on 'cairo' # for cairo-gobject
  depends_on 'atk'
  depends_on 'pango'
  depends_on 'json-glib'
  depends_on :x11 => '2.5.1'
  depends_on 'gobject-introspection' => :recommended

  def install
    args = %W[
      --disable-dependency-tracking
      --disable-debug
      --prefix=#{prefix}
      --disable-silent-rules
      --disable-Bsymbolic
      --disable-tests
      --disable-examples
      --disable-gtk-doc-html
    ]

    if build.with? 'quartz'
      args.concat %w{
        --enable-x11-backend=no
        --enable-quartz-backend=yes
      }
    else
      args.concat %w{
        --enable-x11-backend=yes
        --enable-quartz-backend=no
      }
    end

    if build.without? 'gobject-introspection'
      args << '--disable-introspection'
    end

    system './configure', *args
    system 'make install'
  end
end
