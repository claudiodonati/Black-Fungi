class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: sickle
baseCommand:
  - sickle
  - pe
inputs:
  - id: input_f
    type: File?
    inputBinding:
      position: 0
      prefix: '-f'
  - id: input_r
    type: File?
    inputBinding:
      position: 1
      prefix: '-r'
  - id: output_f
    type: string?
    inputBinding:
      position: 2
      prefix: '-o'
  - id: output_r
    type: string?
    inputBinding:
      position: 3
      prefix: '-p'
  - id: output_s
    type: string?
    inputBinding:
      position: 4
      prefix: '-s'
outputs:
  - id: output_f_file
    type: File?
    outputBinding:
      glob: $(inputs.output_f)
  - id: output_r_file
    type: File?
    outputBinding:
      glob: $(inputs.output_r)
  - id: output_s_file
    type: File?
    outputBinding:
      glob: $(inputs.output_s)
label: sickle
arguments:
  - position: 2
    prefix: '-t'
    valueFrom: sanger
  - position: 5
    prefix: ''
    valueFrom: '-n'
requirements:
  - class: DockerRequirement
    dockerPull: metashot/sickle
  - class: InlineJavascriptRequirement
