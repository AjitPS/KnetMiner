MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10_d:enc] -> (protein_10:Protein)
  - [xref_10_10_3:xref*0..3] - (protein_10b:Protein)
  - [enc_10_9_d:enc] -> (gene_9:Gene)
  - [rel_9_9_2:genetic|physical*0..2] - (gene_9b:Gene)
  - [participates_in_9_4_d:participates_in] -> (bioProc_4:BioProc)
RETURN path