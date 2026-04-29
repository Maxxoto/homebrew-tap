class Autopr < Formula
  desc "AI-powered CLI for automated PR review, smart commits, and PR creation"
  homepage "https://github.com/Maxxoto/autopr-ai"
  url "https://registry.npmjs.org/autopr-ai/-/autopr-ai-0.1.10.tgz"
  sha256 "7fd22c4c367c11d47133a68c0e1f4543b517a82ed46ca0bff62c6bce984bcae8"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", "--production", *std_npm_args
    libexec.install Dir["*"]
    (bin/"autopr").write_env_script("#{libexec}/dist/index.js", PATH: "#{Formula["node@22"].opt_bin}:#{libexec}/node_modules/.bin:$PATH")
  end

  test do
    assert_match "autopr", shell_output("#{bin}/autopr --version")
  end
end
