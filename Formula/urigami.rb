class Urigami < Formula
  desc "Urigami is a command-line utility for managing default applications on macOS"
  homepage ""
  url "https://github.com/noahkamara/urigami/archive/v0.0.1.tar.gz"
  sha256 "409ea55f9c2bcb496053cf67cf16484990015269"
  license "MIT License"
  version "0.0.1"

  def install
    bin.install "urigami"
  end
end
