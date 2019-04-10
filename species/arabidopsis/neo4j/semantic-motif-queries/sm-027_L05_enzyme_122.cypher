MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10_2:genetic|physical*0..2] -> (protein_10b:Protein)
  - [is_a_10_122:is_a] -> (enzyme_122:Enzyme)
RETURN path