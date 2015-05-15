require 'formula'

class Voltdb < Formula
  version '5.2.2'
  homepage 'https://github.com/VoltDB/voltdb'

  if OS.mac?
    url 'http://voltdb.com/downloads/technologies/server/MAC-voltdb-ent-5.2.2.tar.gz'
    sha256 'fb676bfdd67a04f868da205c5c42390474008e121ce2638ddfb6a33908f9d260'
  elsif OS.linux?
    url 'http://voltdb.com/downloads/technologies/server/LINUX-voltdb-ent-5.2.2.tar.gz'
    sha256 'af1f850076dce3ab7e2789a56c076b807b1e4641c1164047ffb7bcb4f5f4b0a6'
  end

  def install

    inreplace Dir["bin/*"] - ["bin/voltadmin"] - ["bin/dragent"] - ["bin/voltdb"] ,
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
