class Autopr < Formula
  desc "AI-powered CLI for automated PR review, smart commits, and PR creation"
  homepage "https://github.com/Maxxoto/autopr-ai"
  url "https://registry.npmjs.org/autopr-ai/-/autopr-ai-0.1.8.tgz"
  sha256 "7e8777640995c2886ad26a08401204bc36401334de35df4d67f3dd6f376016bf"
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
