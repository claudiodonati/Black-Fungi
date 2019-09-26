$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: collect
label: collect
class: ExpressionTool
requirements:
  InlineJavascriptRequirement
inputs:
  file1: File
  file2: File
outputs:
  out: Directory
expression: |
  ${
    return {"out": {
      "class": "Directory", 
      "basename": "my_directory_name",
      "listing": [inputs.file1, inputs.file2]
    } };
  }