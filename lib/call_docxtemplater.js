Docxtemplater = require('docxtemplater');
var fs=require('fs');

var template_path = process.argv[2];
var output_path = process.argv[3];
var data_path = process.argv[4];

var template = fs.readFileSync(template_path, "binary");
var data = fs.readFileSync(data_path, "binary");
var data_json = JSON.parse(data);

var doc=new Docxtemplater(template);
doc.setData(data_json);
doc.render();

var buf = doc.getZip().generate({type:"nodebuffer"});
fs.writeFileSync(output_path, buf);