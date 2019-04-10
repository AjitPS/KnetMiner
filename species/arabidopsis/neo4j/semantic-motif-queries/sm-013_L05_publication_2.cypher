MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:genetic|physical*0..2] -> (protein_10:Protein)
  - [pub_in_10_2:pub_in] -> (publication_2:Publication)
RETURN path