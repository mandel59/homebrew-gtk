require 'formula'

class JsonGlib < Formula
  homepage 'http://live.gnome.org/JsonGlib'
  url 'http://download.gnome.org/sources/json-glib/1.0/json-glib-1.0.0.tar.xz'
  sha256 'dbf558d2da989ab84a27e4e13daa51ceaa97eb959c2c2f80976c9322a8f4cdde'

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'gobject-introspection' => :recommended

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    if build.with? 'gobject-introspection'
      args << '--enable-introspection'
    end

    system "./configure", *args
    system "make install"
  end
end
