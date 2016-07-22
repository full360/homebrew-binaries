require 'formula'

class Voltdb < Formula
  version '6.4'
  homepage 'https://github.com/VoltDB/voltdb'

  if OS.mac?
    url 'http://voltdb.com/downloads/technologies/server/MAC-voltdb-ent-6.4.tar.gz'
    sha256 '977f81869a217381b3fd6e791c384f13e170f60d95bd7c7baf6bb10a5968804d'
  elsif OS.linux?
    url 'http://voltdb.com/downloads/technologies/server/LINUX-voltdb-ent-6.4.tar.gz'
  end

  def install

    inreplace Dir["bin/*"] - ["bin/voltadmin"] - ["bin/dragent"] - ["bin/voltdb"] ,
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
