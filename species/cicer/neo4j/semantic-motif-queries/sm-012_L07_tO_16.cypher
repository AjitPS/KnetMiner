MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:h_s_s|ortho*0..1] -> (protein_10:Protein)
  - [enc_10_9:enc] -> (gene_9:Gene)
  - [it_wi_9_9:it_wi*0..2] -> (gene_9:Gene)
  - [cooc_wi_9_16:cooc_wi] -> (tO_16:TO)
RETURN path