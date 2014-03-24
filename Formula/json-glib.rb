require 'formula'

class JsonGlib < Formula
  homepage 'http://live.gnome.org/JsonGlib'
  url 'http://ftp.gnome.org/pub/GNOME/sources/json-glib/0.16/json-glib-0.16.2.tar.xz'
  sha256 'a95475364ec27ab1d2a69303cf579018558bfb6981e3498b3aaf1e6401f7422c'

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
