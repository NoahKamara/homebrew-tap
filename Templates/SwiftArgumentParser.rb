class #{FORMULA_CLASS_NAME} < Formula
  desc "#{DESCRIPTION}"
  homepage "#{HOMEPAGE}"
  url "#{URL}"
  sha256 "#{SHA256}"
  version "#{VERSION}"

  def install
    bin.install "#{SCRIPT_NAME}"
    
    # Generate and install completions
    bash_output = Utils.safe_popen_read("#{bin}/#{SCRIPT_NAME}", "--generate-completion-script", "bash")
    (bash_completion/"#{SCRIPT_NAME}").write bash_output

    zsh_output = Utils.safe_popen_read("#{bin}/#{SCRIPT_NAME}", "--generate-completion-script", "zsh")
    (zsh_completion/"#{SCRIPT_NAME}").write zsh_output

    fish_output = Utils.safe_popen_read("#{bin}/#{SCRIPT_NAME}", "--generate-completion-script", "fish")
    (fish_completion/"#{SCRIPT_NAME}.fish").write fish_output

    bin.install "#{SCRIPT_NAME}"
  end

  test do
    system "#{bin}/#{SCRIPT_NAME}", "--version"
  end
end
