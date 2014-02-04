require 'formula'

class Gtkx3Quartz < Formula
  homepage 'http://gtk.org/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/3.10/gtk+-3.10.6.tar.xz'
  sha256 '3c24c57fc5cb7a5ea39d3a3ff7b12be63d7f21a52fd6f20f7b983e19b7b0268a'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'glib'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'gdk-pixbuf'
  depends_on 'pango-quartz'
  depends_on 'cairo-quartz'
  depends_on 'atk'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-glibtest",
                          "--disable-introspection",
                          "--enable-quartz-backend",
                          "--enable-quartz-relocation"

    system "make install"
    # Prevent a conflict between this and Gtk+2
    mv bin/'gtk-update-icon-cache', bin/'gtk3-update-icon-cache'
  end

  def test
    system "#{bin}/gtk3-demo"
  end
end
