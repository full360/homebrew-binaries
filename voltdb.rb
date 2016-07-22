require 'formula'

class Voltdb < Formula
  version '6.4'
  homepage 'https://github.com/VoltDB/voltdb'

  if OS.mac?
    url 'http://voltdb.com/downloads/technologies/server/MAC-voltdb-ent-6.4.tar.gz'
    sha256 'd4b9bacb498e53d91c42366beee541d125dd0f47ad54f2041406dd9e9628aea5'
  elsif OS.linux?
    url 'http://voltdb.com/downloads/technologies/server/LINUX-voltdb-ent-6.4.tar.gz'
  end

  def install

    inreplace Dir["bin/*"] - ["bin/voltadmin", "bin/dragent", "bin/voltdb", "bin/rabbitmqloader", "bin/voltdeploy", "bin/voltenv"] ,
      /VOLTDB_LIB=\$VOLTDB_HOME\/lib/, 'VOLTDB_LIB=$VOLTDB_HOME/lib/voltdb'

    (lib/'voltdb').install Dir['lib/*']
    lib.install_symlink lib/"voltdb/python"
    prefix.install 'bin', 'tools', 'voltdb', 'version.txt', 'doc'
  end
end
