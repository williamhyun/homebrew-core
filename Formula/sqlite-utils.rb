class SqliteUtils < Formula
  include Language::Python::Virtualenv
  desc "CLI utility for manipulating SQLite databases"
  homepage "https://sqlite-utils.datasette.io/"
  url "https://files.pythonhosted.org/packages/92/b6/0a91a81b21b7be2dfdb2e964941000d299168dea582bfb899dfae5425abf/sqlite-utils-3.27.tar.gz"
  sha256 "49eadc3cad92bebabbac450b825be3ab5277155d31d1a1c72acef61e65e44c6a"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "77807ffb7a6bc884b61fd33ade6173153407ee526b551a58044f7970d3771453"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "454643ec6f4289f47fcd81e9c87ec52d66a2313e9de52a6e16f0dc00ca9d0860"
    sha256 cellar: :any_skip_relocation, monterey:       "fd63d789c47d1a77ebcbba8ab8c4a668a06ed60bb52906766c620d1ddb60c2e0"
    sha256 cellar: :any_skip_relocation, big_sur:        "f87f20558e31d8ab716ffa321874752fb5b28f639362a8302e86f87406ace434"
    sha256 cellar: :any_skip_relocation, catalina:       "59c825ff22b585265850bf523a6ab039f9d0016b2413314f3e6c2b5b02d9e9e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "7c9d46bf3cbf52f51ef1dbdc6c426a2db341b2f352566fbf4bda76c53b534f7a"
  end

  depends_on "python-tabulate"
  depends_on "python@3.9"
  depends_on "six"

  resource "click" do
    url "https://files.pythonhosted.org/packages/59/87/84326af34517fca8c58418d148f2403df25303e02736832403587318e9e8/click-8.1.3.tar.gz"
    sha256 "7682dc8afb30297001674575ea00d1814d808d6a36af415a82bd481d37ba7b8e"
  end

  resource "click-default-group-wheel" do
    url "https://files.pythonhosted.org/packages/3d/da/f3bbf30f7e71d881585d598f67f4424b2cc4c68f39849542e81183218017/click-default-group-wheel-1.2.2.tar.gz"
    sha256 "e90da42d92c03e88a12ed0c0b69c8a29afb5d36e3dc8d29c423ba4219e6d7747"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/4c/c4/13b4776ea2d76c115c1d1b84579f3764ee6d57204f6be27119f13a61d0a9/python-dateutil-2.8.2.tar.gz"
    sha256 "0123cacc1627ae19ddf3c27a5de5bd67ee4586fbdd6440d9748f8abb483d3e86"
  end

  resource "sqlite-fts4" do
    url "https://files.pythonhosted.org/packages/62/30/63e64b7b8fa69aabf97b14cbc204cb9525eb2132545f82231c04a6d40d5c/sqlite-fts4-1.0.1.tar.gz"
    sha256 "b2d4f536a28181dc4ced293b602282dd982cc04f506cf3fc491d18b824c2f613"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "15", shell_output("#{bin}/sqlite-utils :memory: 'select 3 * 5'")
  end
end
