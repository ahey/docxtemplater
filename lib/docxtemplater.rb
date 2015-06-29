require "docxtemplater/version"
require "json"

module Docxtemplater
  def self.render(template_path, output_path, data)
    data_tmp_file = Tempfile.new('docxtemplater').tap do |file|
      file.write(data.to_json)
      file.close
    end

    begin
      script_path = File.join(__dir__, 'call_docxtemplater.js')
      system  "node #{script_path} #{template_path} #{output_path} #{data_tmp_file.path}"
    ensure
      data_tmp_file.unlink
    end
  end
end
