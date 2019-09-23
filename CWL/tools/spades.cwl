class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: spades
baseCommand:
  - spades.py
inputs:
  - id: input_f
    type: File?
    inputBinding:
      position: 0
      prefix: '-1'
  - id: input_r
    type: File?
    inputBinding:
      position: 1
      prefix: '-2'
  - id: output
    type: string?
    inputBinding:
      position: 3
      prefix: '-o'
  - id: input_s
    type: File?
    inputBinding:
      position: 2
      prefix: '-s'
outputs:
  - id: output_dir
    type: Directory
    outputBinding:
      glob: $(inputs.output)
label: spades
requirements:
  - class: DockerRequirement
    dockerPull: metashot/spades
  - class: InlineJavascriptRequirement
