class DevcontainersCli < Formula
  require "language/node"

  desc "Dev Containers CLI"
  homepage "https://code.visualstudio.com/docs/remote/devcontainer-cli"
  url "https://registry.npmjs.org/@devcontainers/cli/-/cli-0.30.0.tgz"
  sha256 "aec01a668552a48e24b7ecae5caca97d5a12950d3a19810450eedd265d120f06"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@devcontainers/cli/latest"
    regex(/["']version["']:\s*?["']([^"']+)["']/i)
  end

  conflicts_with "vscode-dev-container-cli", because: "both install a `devcontainer` executable"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system "#{bin}/devcontainer", "--help"
    assert_predicate testpath/"package.json", :exist?, "package.json must exist"
  end
end
