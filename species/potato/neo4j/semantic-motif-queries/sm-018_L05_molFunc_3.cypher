MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:equivalent|h_s_s|ortho*0..1] -> (protein_10b:Protein)
  - [has_function_10_3:has_function] -> (molFunc_3:MolFunc)
RETURN path