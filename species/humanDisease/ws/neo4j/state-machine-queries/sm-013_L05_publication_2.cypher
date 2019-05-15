MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:it_wi|ortho*0..1] -> (protein_10b:Protein)
  - [pub_in_10_2:pub_in] -> (publication_2:Publication)
RETURN path