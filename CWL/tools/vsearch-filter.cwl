class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: vsearch_filter
baseCommand:
  - vsearch
inputs:
  - id: input
    type: File?
    inputBinding:
      position: 0
outputs: []
label: vsearch-filter
