class Autopr < Formula
  desc "AI-powered CLI for automated PR review, smart commits, and PR creation"
  homepage "https://github.com/Maxxoto/autopr"
  url "https://registry.npmjs.org/autopr/-/autopr-0.1.0.tgz"
  sha256 "placeholder_will_be_updated_on_first_release"
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