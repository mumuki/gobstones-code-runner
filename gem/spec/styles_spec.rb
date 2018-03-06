require "spec_helper"

describe Gobstones::CodeRunner do
  it { expect(File.exist? Gobstones::CodeRunner.assets_path_for('htmls/gobstones-code-runner.html')).to be true }
  it { expect(File.exist? Gobstones::CodeRunner.assets_path_for('htmls/vendor/polymer.html')).to be true }
  it { expect(File.exist? Gobstones::CodeRunner.assets_path_for('javascripts/vendor/webcomponents-lite.min.js')).to be true }
end
