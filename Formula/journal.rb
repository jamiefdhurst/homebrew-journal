class Journal < Formula
  desc "Simple personal journal web application"
  homepage "https://github.com/jamiefdhurst/journal"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jamiefdhurst/journal/releases/download/v#{version}/journal-#{version}-darwin-arm64.zip"
      sha256 "65cc8fe37dc0787aface24d2da3b9358d3980e0a8574f9ce957d6b41a6e4268c"
    end
    on_intel do
      url "https://github.com/jamiefdhurst/journal/releases/download/v#{version}/journal-#{version}-darwin-amd64.zip"
      sha256 "6232507aa7315938c473bfe8ac88975a3d56b769e2e959106fdb0cd4ae75d364"
    end
  end

  def install
    libexec.install "journal" => "journal-bin"
    libexec.install "web"
    (bin/"journal").write "#!/bin/sh\ncd \"#{libexec}\"\nexec \"#{libexec}/journal-bin\" \"$@\"\n"
  end

  test do
    output = shell_output("#{bin}/journal 2>&1", 1)
    assert_match "Journal v#{version}", output
  end
end
