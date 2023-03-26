class Terraformsh < Formula
  desc "A wrapper for Terraform in Bash"
  homepage "https://github.com/pwillis-els/terraformsh"
  url "https://github.com/pwillis-els/terraformsh/archive/refs/tags/v0.13.tar.gz"
  sha256 "a785d8597df71c669d91247bd674bdc57b426cdde648d5af36fd834787b8fe59"
  license "MIT"
  head "https://github.com/pwillis-els/terraformsh.git", branch: "master"
  
  def install
    bin.install "terraformsh"
  end
  test do
    system "#{bin}/terraformsh", "-h"
  end
end
