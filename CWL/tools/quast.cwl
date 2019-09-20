class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: quast
baseCommand:
  - quast.py
  - '-f'
  - '-b'
  - '--fungus'
inputs:
  - id: input
    type: Directory
    inputBinding:
      position: 0
      valueFrom: $(inputs.input.path)/contigs.fasta
outputs:
  - id: output
    type: Directory?
label: quast
requirements:
  - class: DockerRequirement
    dockerPull: staphb/quast
  - class: InlineJavascriptRequirement
