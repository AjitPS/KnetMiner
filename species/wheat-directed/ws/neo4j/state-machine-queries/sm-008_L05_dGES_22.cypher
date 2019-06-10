MATCH path = (gene_1:Gene{ iri: $startIri })
  - [homoeolog_1_9:homoeolog] - (gene_9:Gene)
  - [rel_9_9_d_3:genetic|physical*0..3] -> (gene_9b:Gene)
  - [differentially_expressed_9_22_d:differentially_expressed] -> (dGES_22:DGES)
RETURN path