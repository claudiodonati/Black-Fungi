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
      position: 1
      valueFrom: $(inputs.input.path)/contigs.fasta
  - id: output
    type: string?
    inputBinding:
      position: 0
      prefix: '-o'
outputs:
  - id: output_dir
    type: Directory?
    outputBinding:
      glob: $(inputs.output)
label: quast
requirements:
  - class: DockerRequirement
    dockerPull: staphb/quast
  - class: InlineJavascriptRequirement
