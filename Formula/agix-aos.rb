# Homebrew formula for Agix AOS — `brew install agix-aos`.
#
# Installs the Agix AOS runtime tree (the `agix` CLI + the agent fleet + lib +
# vendored prod deps) into libexec and exposes `agix` on PATH.
class AgixAos < Formula
  desc "Agix AOS — the agix CLI and agent fleet (agentic operating system)"
  homepage "https://github.com/blewis-maker/homebrew-agix"
  url "https://github.com/blewis-maker/homebrew-agix/releases/download/v0.1.0/agix-aos-0.1.0.tar.gz"
  version "0.1.0"
  sha256 "936eb6f6de189ec68cfd1df162e5f4550f063592af19c4023330097458f3ec52"
  license "Apache-2.0"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    # Wrapper invokes the brew-managed node explicitly so the install is PATH-independent.
    (bin/"agix").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/agix" "$@"
    SH
  end

  test do
    assert_match "agix #{version}", shell_output("#{bin}/agix --version")
  end
end
