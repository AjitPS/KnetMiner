MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10_d:enc] -> (protein_10:Protein)
  - [h_s_s_10_10:h_s_s*0..] - (protein_10b:Protein)
  - [enc_10_9_d:enc] -> (gene_9:Gene)
  - [rel_9_9_2:genetic|physical*0..2] - (gene_9b:Gene)
  - [located_in_9_5_d:located_in] -> (celComp_5:CelComp)
RETURN path