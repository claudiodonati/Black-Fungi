class: Workflow
cwlVersion: v1.0
id: filter_assemble
label: filter_assemble
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: input_r
    type: File?
    'sbg:x': -496
    'sbg:y': -254
  - id: input_f
    type: File?
    'sbg:x': -494
    'sbg:y': -59
  - id: output
    type: string?
    'sbg:exposed': true
outputs:
  - id: output_s_file
    outputSource:
      - sickle/output_s_file
    type: File?
    'sbg:x': -68
    'sbg:y': -321
  - id: output_r_file
    outputSource:
      - sickle/output_r_file
    type: File?
    'sbg:x': -50.203125
    'sbg:y': -179
  - id: output_f_file
    outputSource:
      - sickle/output_f_file
    type: File?
    'sbg:x': -199.203125
    'sbg:y': 61.192962646484375
  - id: output_dir
    outputSource:
      - spades/output_dir
    type: Directory?
    'sbg:x': 154.22640991210938
    'sbg:y': -141.89308166503906
  - id: output_dir_1
    outputSource:
      - quast/output_dir
    type: Directory?
    'sbg:x': 334.99188232421875
    'sbg:y': 23
steps:
  - id: sickle
    in:
      - id: input_f
        source: input_f
      - id: input_r
        source: input_r
      - id: output_f
        default: filtered_f.fastq
      - id: output_r
        default: filtered_r.fastq
      - id: output_s
        default: filtered_s.fastq
    out:
      - id: output_f_file
      - id: output_r_file
      - id: output_s_file
    run: ../tools/sickle.cwl
    label: sickle
    'sbg:x': -305
    'sbg:y': -150
  - id: spades
    in:
      - id: input_f
        source: sickle/output_f_file
      - id: input_r
        source: sickle/output_r_file
      - id: output
        default: assembled
      - id: input_s
        source: sickle/output_s_file
    out:
      - id: output_dir
    run: ../tools/spades.cwl
    label: spades
    'sbg:x': -29
    'sbg:y': -17
  - id: quast
    in:
      - id: input
        source: spades/output_dir
      - id: output
        source: output
    out:
      - id: output_dir
    run: ../tools/quast.cwl
    label: quast
    'sbg:x': 189
    'sbg:y': 46
requirements: []
