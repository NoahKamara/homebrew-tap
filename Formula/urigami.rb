class Urigami < Formula
  desc "command-line utility for managing default applications on macOS"
  homepage "https://github.com/NoahKamara/Urigami"
  url "https://github.com/NoahKamara/Urigami/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  version "v0.1.2"

  def install
    # Build
    system "swift", "build", "-c", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"

    # Install
    bin.install ".build/apple/Products/Release/urigami"

    # Generate and install completions
    generate_completions_from_executable(bin/"urigami", "--generate-completion-script")
  end

  test do
    system "#{bin}/urigami", "--version"
  end
end

