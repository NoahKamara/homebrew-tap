class #{FORMULA_CLASS_NAME} < Formula
  desc "#{DESCRIPTION}"
  homepage "#{HOMEPAGE}"
  url "#{URL}"
  sha256 "#{SHA256}"
  version "#{VERSION}"

  def install
    bin.install "#{SCRIPT_NAME}"
  end

  test do
    system "#{bin}/#{SCRIPT_NAME}", "--version"
  end
end
