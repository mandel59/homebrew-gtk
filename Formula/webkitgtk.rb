require 'formula'

class Webkitgtk < Formula
  homepage 'http://webkitgtk.org/'
  url 'http://webkitgtk.org/releases/webkitgtk-2.0.1.tar.xz'
  sha1 '43323e8e79ba29f41bd2a93bb35c53cfd89b7741'

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'xz' => :build
  depends_on 'gtk+-quartz'
#  depends_on 'gtk+3-quartz'
  depends_on 'webp'
  depends_on 'zlib'
  depends_on 'libsoup'
  depends_on 'libsecret'
  depends_on 'freetype'
  depends_on 'harfbuzz'
  depends_on 'fontconfig'
  depends_on 'enchant'
  depends_on 'gst-plugins-base-quartz'

  def install

    system "./configure", "--disable-debug",# "--disable-dependency-tracking",
                          "--enable-static", "--disable-shared",
                          "--prefix=#{prefix}",
                          "--with-gtk=2.0", 
                          "--with-target=quartz",
                          "--enable-webkit2=no",
                          "--enable-geolocation=no"

    system "make", "install"
  end

  test do
    system "false"
  end

end
