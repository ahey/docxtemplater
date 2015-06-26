require 'spec_helper'

describe Docxtemplater do
  it 'has a version number' do
    expect(Docxtemplater::VERSION).not_to be nil
  end

  it 'generates the bash command' do
    template_path = 'template.docx'
    output_path = 'rendered.docx'
    data = { animal: 'dog' }
    command = Docxtemplater.generate_bash_command(template_path, output_path, data)
    script_path = File.join(__dir__.gsub('/spec',''), 'lib', 'call_docxtemplater.js')
    expect(command).to eq('node ' + script_path + ' template.docx rendered.docx ' + "\\{\\\"animal\\\":\\\"dog\\\"\\}")
  end

  it 'renders the file' do
    template_path = File.join(__dir__, 'fixtures', 'template.docx')
    output_path = File.join(__dir__, 'rendered.docx')
    File.delete(output_path) if File.exist?(output_path)
    data = { animal: 'dog' }
    Docxtemplater.render(template_path, output_path, data)
    expect(File).to exist(output_path)
  end
end
