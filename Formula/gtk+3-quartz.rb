require 'formula'

class Gtkx3Quartz < Formula
  homepage 'http://gtk.org/'
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/3.10/gtk+-3.10.7.tar.xz'
  sha256 'b7e9de15385031cff43897e7e59f6692eaabf500f36eef80e6b9d6486ad49427'

  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'glib'
  depends_on 'jpeg'
  depends_on 'libtiff'
  depends_on 'gdk-pixbuf'
  depends_on 'pango-quartz'
  depends_on 'cairo-quartz'
  depends_on 'jasper' => :optional
  depends_on 'atk'
  depends_on 'at-spi2-atk'
  depends_on 'gobject-introspection'

  def patches
    # This patch just barely missed the release
    # https://www.mail-archive.com/gtk-osx-devel-list@gnome.org/msg00079.html
    DATA
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--disable-glibtest",
                          "--enable-introspection=yes",
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

__END__
diff --git a/gtk/gtkselection.c b/gtk/gtkselection.c
index 1c77002..3fa8971 100644
--- a/gtk/gtkselection.c
+++ b/gtk/gtkselection.c
@@ -2294,7 +2294,7 @@ _gtk_selection_request (GtkWidget *widget,
   gulong selection_max_size;

   if (event->requestor == NULL)
-    return;
+    return FALSE;

   if (initialize)
     gtk_selection_init ();