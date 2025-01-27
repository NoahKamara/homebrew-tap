class #{FORMULA_CLASS_NAME} < Formula
  desc "#{DESCRIPTION}"
  homepage "#{HOMEPAGE}"
  url "#{URL}"
  sha256 "#{SHA256}"
  version "#{VERSION}"

  def install
    # Build
    system "swift", "build", "-c", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"

    # Install
    bin.install ".build/apple/Products/Release/#{SCRIPT_NAME}"

    # Generate and install completions
    generate_completions_from_executable(bin/"#{SCRIPT_NAME}", "--generate-completion-script")
  end

  test do
    system "#{bin}/#{SCRIPT_NAME}", "--version"
  end
end
