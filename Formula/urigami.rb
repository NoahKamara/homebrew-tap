class Urigami < Formula
  desc "a command-line utility for managing default applications on macOS"
  homepage "https://github.com/NoahKamara/Urigami"
  url "https://github.com/NoahKamara/Urigami/releases/download/v0.1.0/v0.1.0.tar.gz"
  sha256 "779a7f7ba7d1f555debcbffb4583cbf099a978d67c10ed788e6030d7343e36a2"
  version "v0.1.0"

  def install
    bin.install "urigami"
  end

  test do
    system "#{bin}/urigami", "--version"
  end
end
