Docxtemplater = require('docxtemplater');

var template_path = process.argv[2];
var output_path = process.argv[3];

console.log(process.argv[4]);
var data = JSON.parse(process.argv[4]);

var fs=require('fs');
var template = fs.readFileSync(template_path, "binary");

var doc=new Docxtemplater(template);
doc.setData(data);
doc.render();

var buf = doc.getZip().generate({type:"nodebuffer"});
fs.writeFileSync(output_path, buf);