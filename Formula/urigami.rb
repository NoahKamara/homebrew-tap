class Urigami < Formula
  desc "a command-line utility for managing default applications on macOS"
  homepage "https://github.com/NoahKamara/Urigami"
  url "https://github.com/NoahKamara/Urigami/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "11351401ac9d5f3b9c743f7d71e3dd0f040f4719e1d6a303ededb61eeae8a395"
  version "v0.1.1"

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
