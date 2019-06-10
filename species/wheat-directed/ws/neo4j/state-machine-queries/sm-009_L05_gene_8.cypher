MATCH path = (gene_1:Gene{ iri: $startIri })
  - [homoeolog_1_9:homoeolog] - (gene_9:Gene)
  - [rel_9_9_d_3:genetic|physical*0..3] -> (gene_9b:Gene)
  - [rel_9_8_d_3:genetic|physical*1..3] -> (gene_8:Gene)
RETURN path