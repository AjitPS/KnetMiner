MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:genetic|physical*0..2] -> (protein_10:Protein)
  - [has_function_10_3:has_function] -> (molFunc_3:MolFunc)
RETURN path