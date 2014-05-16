require 'formula'

class Voltdb < Formula
  version '4.3'
  homepage 'https://github.com/VoltDB/voltdb'

  if OS.mac?
    url 'http://voltdb.com/downloads/technologies/server/MAC-voltdb-ent-4.3.tar.gz'
    sha256 'fb676bfdd67a04f868da205c5c42390474008e121ce2638ddfb6a33908f9d260'
  elsif OS.linux?
    url 'http://voltdb.com/downloads/technologies/server/LINUX-voltdb-ent-4.3.tar.gz'
    sha1 '281e6541d0a98e737ec17576d5ae03fef36ff46d'
  end

  def install

    inreplace Dir["bin/*"] - ["bin/voltadmin"],
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
