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
    'sbg:x': -113.40499114990234
    'sbg:y': -187.5972900390625
  - id: output_f_file
    outputSource:
      - sickle/output_f_file
    type: File?
    'sbg:x': -165.68551635742188
    'sbg:y': 51.32805252075195
  - id: output_dir
    outputSource:
      - spades/output_dir
    type: Directory?
    'sbg:x': 154.22640991210938
    'sbg:y': -141.89308166503906
  - id: report
    outputSource:
      - quast/report
    type: File?
    'sbg:x': 354.49322509765625
    'sbg:y': -109.06109619140625
  - id: busco_stats
    outputSource:
      - quast/busco_stats
    type: Directory?
    'sbg:x': 365.805419921875
    'sbg:y': 45.05881881713867
  - id: basic_stats
    outputSource:
      - quast/basic_stats
    type: Directory?
    'sbg:x': 300.3110656738281
    'sbg:y': 185.34463500976562
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
      - id: report
      - id: basic_stats
      - id: busco_stats
    run: ../tools/quast.cwl
    label: quast
    'sbg:x': 184
    'sbg:y': 71
requirements: []
