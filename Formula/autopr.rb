class Autopr < Formula
  desc "AI-powered CLI for automated PR review, smart commits, and PR creation"
  homepage "https://github.com/Maxxoto/autopr-ai"
  url "https://registry.npmjs.org/autopr-ai/-/autopr-ai-0.1.7.tgz"
  sha256 "6a520ac09f4e8a99faf3a011a5b5dbe623167f014f745a09b10e981441015693"
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
