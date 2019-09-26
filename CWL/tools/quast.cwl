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
      valueFrom: $(inputs.output)
outputs:
  - id: report
    type: File?
    outputBinding:
      glob: $(inputs.output)/report.txt
  - id: basic_stats
    type: Directory?
    outputBinding:
      glob: $(inputs.output)/basic_stats
  - id: busco_stats
    type: Directory?
    outputBinding:
      glob: $(inputs.output)/busco_stats
label: quast
requirements:
  - class: DockerRequirement
    dockerPull: staphb/quast
  - class: InlineJavascriptRequirement
