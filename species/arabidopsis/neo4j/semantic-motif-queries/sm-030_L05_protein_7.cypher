MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10_2:genetic|physical*0..2] -> (protein_10b:Protein)
  - [rel_10_7:h_s_s|ortho|xref] -> (protein_7:Protein)
RETURN path