require 'formula'

class GtkMacIntegration < Formula
  homepage 'https://wiki.gnome.org/Projects/GTK%2B/OSX/Integration'
  url 'http://ftp.acc.umu.se/pub/gnome/sources/gtk-mac-integration/2.0/gtk-mac-integration-2.0.5.tar.xz'
  sha256 '6c4ff7501d7ff35e49068052d80fcf76ce494e5953c5f3967e4958b1b0c67b9f'

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gtk+3'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
