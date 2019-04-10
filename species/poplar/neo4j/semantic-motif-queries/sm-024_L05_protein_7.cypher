MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [xref_10_10:xref*0..2] -> (protein_10:Protein)
  - [rel_10_7:h_s_s|ortho] -> (protein_7:Protein)
RETURN path