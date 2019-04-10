MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:it_wi|ortho*0..1] -> (protein_10:Protein)
  - [enc_10_17:enc] -> (gene_17:Gene)
  - [differentially_expressed_17_16:differentially_expressed] -> (dGES_16:DGES)
RETURN path