require "spec_helper"

describe Gobstones::Blockly do
  it { expect(File.exist? Gobstones::Blockly.assets_path_for('htmls/gobstones-code-runner.html')).to be true }
  it { expect(File.exist? Gobstones::Blockly.assets_path_for('htmls/vendor/polymer.html')).to be true }
  it { expect(File.exist? Gobstones::Blockly.assets_path_for('javascripts/vendor/webcomponents-lite.min.js')).to be true }
end