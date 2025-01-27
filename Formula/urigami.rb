class Urigami < Formula
  desc "a command-line utility for managing default applications on macOS"
  homepage "https://github.com/NoahKamara/Urigami"
  url "https://github.com/NoahKamara/Urigami/releases/download/v0.1.1/v0.1.1.tar.gz"
  sha256 "8e38e71025f611ad0a7c49cefafa9562c21990577db57ab5bc1e2ae116dd19df"
  version "v0.1.1"

  def install
    bin.install "urigami"
    
    # Generate and install completions
    bash_output = Utils.safe_popen_read("#{bin}/urigami", "--generate-completion-script", "bash")
    (bash_completion/"urigami").write bash_output

    zsh_output = Utils.safe_popen_read("#{bin}/urigami", "--generate-completion-script", "zsh")
    (zsh_completion/"urigami").write zsh_output

    fish_output = Utils.safe_popen_read("#{bin}/urigami", "--generate-completion-script", "fish")
    (fish_completion/"urigami.fish").write fish_output

    bin.install "urigami"
  end

  test do
    system "#{bin}/urigami", "--version"
  end
end
