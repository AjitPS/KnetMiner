MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] - (protein_10:Protein)
  - [rel_10_10_d_2:genetic|physical*0..2] -> (protein_10b:Protein)
  - [enc_10_9:enc] - (gene_9:Gene)
  - [has_function_9_3:has_function] - (molFunc_3:MolFunc)
RETURN path