MATCH path = (gene_1:Gene{ iri: $startIri })
  - [rel_1_9:homoeolog|regulates] - (gene_9:Gene)
  - [rel_9_9_3:genetic|physical*0..3] - (gene_9b:Gene)
  - [enc_9_10_d:enc] -> (protein_10:Protein)
  - [xref_10_10_2:xref*0..2] - (protein_10b:Protein)
  - [has_function_10_3_d:has_function] -> (molFunc_3:MolFunc)
RETURN path