MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:equivalent|h_s_s|ortho*0..1] -> (protein_10:Protein)
  - [enc_10_9:enc] -> (gene_9:Gene)
  - [rel_9_9:genetic|physical*0..2] -> (gene_9:Gene)
  - [rel_9_8:genetic|physical*1..2] -> (gene_8:Gene)
RETURN path