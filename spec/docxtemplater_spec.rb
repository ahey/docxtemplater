require 'spec_helper'

describe Docxtemplater do
  it 'has a version number' do
    expect(Docxtemplater::VERSION).not_to be nil
  end

  it 'renders the file' do
    template_path = File.join(__dir__, 'fixtures', 'template.docx')
    output_path = File.join(__dir__, 'rendered.docx')
    File.delete(output_path) if File.exist?(output_path)
    data = { animal: 'dog' }
    Docxtemplater.render(template_path, output_path, data)
    expect(File).to exist(output_path)

    puts "CHECK: manually check that the data was merged into #{output_path}"
  end
end
