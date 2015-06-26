require "docxtemplater/version"
require "json"

module Docxtemplater
  def self.render(template_path, output_path, data)
    command = generate_bash_command(template_path, output_path, data)
    system command
  end

  def self.generate_bash_command(template_path, output_path, data)
    script_path = File.join(__dir__, 'call_docxtemplater.js')

    "node #{script_path} #{template_path} #{output_path} #{Shellwords.escape(data.to_json)}"
  end
end
