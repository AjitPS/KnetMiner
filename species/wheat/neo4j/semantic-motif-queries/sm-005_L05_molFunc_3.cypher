MATCH path = (gene_1:Gene{ iri: $startIri })
  - [rel_1_9:homoeolog|regulates] -> (gene_9:Gene)
  - [rel_9_9:genetic|physical*0..3] -> (gene_9:Gene)
  - [has_function_9_3:has_function] -> (molFunc_3:MolFunc)
RETURN path