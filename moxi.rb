require 'formula'

class Moxi <Formula
  head 'https://github.com/couchbase/moxi.git', :using => :git
  homepage 'https://github.com/couchbase/moxi'
  md5 '4b391021af7a453bf88716724d2c644916ebd969'

 depends_on 'check'

  def install
    paths = %W[#{HOMEBREW_PREFIX}/lib/pkgconfig /usr/local/lib/pkgconfig /usr/lib/pkgconfig /usr/X11/lib/pkgconfig].uniq
    ENV['PKG_CONFIG_PATH'] = paths.join(":")
    system "./config/autorun.sh"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
