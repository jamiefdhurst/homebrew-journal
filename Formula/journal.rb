class Journal < Formula
  desc "Simple personal journal web application"
  homepage "https://github.com/jamiefdhurst/journal"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jamiefdhurst/journal/releases/download/v#{version}/journal_darwin_arm64-#{version}"
      sha256 "ba5a0e67faa6e355840d33ea3be30c21e153c55da33376b3e66afb42f022dce2"
    end
    on_intel do
      url "https://github.com/jamiefdhurst/journal/releases/download/v#{version}/journal_darwin_amd64-#{version}"
      sha256 "4c92ef421e74c0c278698e77608cc07417685691e9e115954d2cd3fb0f0e2558"
    end
  end

  def install
    bin.install Dir["journal_darwin_*"].first => "journal"
  end

  test do
    output = shell_output("#{bin}/journal 2>&1", 1)
    assert_match "Journal v#{version}", output
  end
end
