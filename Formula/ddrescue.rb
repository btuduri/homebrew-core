class Ddrescue < Formula
  desc "GNU data recovery tool"
  homepage "https://www.gnu.org/software/ddrescue/ddrescue.html"
  url "http://ftpmirror.gnu.org/ddrescue/ddrescue-1.21.tar.lz"
  mirror "https://ftp.gnu.org/gnu/ddrescue/ddrescue-1.21.tar.lz"
  sha256 "f09e4eb6a209cbd0fe8ee6db2d558238cdc969afa1d94150f263402ac882e1ac"

  bottle do
    cellar :any_skip_relocation
    sha256 "a98bfe8ce9183904ec2cc9eb1049b69aa1d6d6f2973ae234af30333765b81cdb" => :el_capitan
    sha256 "7c6845909d1ce7f5444c1d4be2db26a6a1a765363bc1ebf6730c7770f3d45d76" => :yosemite
    sha256 "5f6feecff7532f206d76d858e8a8be1bfdd9256737de9da9feb303aa0451db55" => :mavericks
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "CXX=#{ENV.cxx}"
    system "make", "install"
  end

  test do
    system bin/"ddrescue", "--force", "--size=64Ki", "/dev/zero", "/dev/null"
  end
end
