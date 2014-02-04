require 'formula'

class GstPluginsBaseQuartz < Formula
  homepage 'http://gstreamer.freedesktop.org/'
  url 'http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.2.1.tar.xz'
  mirror 'http://ftp.osuosl.org/pub/blfs/svn/g/gst-plugins-base-1.2.1.tar.xz'
  sha256 'de2444a5c150d4e4b680364d7c0414cd8b015d95b305ff65d65a17683379532f'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'gettext'
  depends_on 'gstreamer'
  depends_on 'gtk+-quartz'
  depends_on 'pango-quartz'
  depends_on 'libogg'
  depends_on 'theora'
  depends_on 'libvorbis'
  depends_on 'orc'

  depends_on 'gobject-introspection' => :optional

  def install
    # gnome-vfs turned off due to lack of formula for it.
    args = %W[
      --prefix=#{prefix}
      --disable-debug
      --disable-dependency-tracking
      --enable-experimental
      --disable-libvisual
      --disable-alsa
      --disable-cdparanoia
      --without-x
      --disable-x
      --disable-xvideo
      --disable-xshm
    ]
    system "./configure", *args
    system "make"
    system "make install"
  end
end
