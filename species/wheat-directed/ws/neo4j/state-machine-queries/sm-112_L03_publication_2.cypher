MATCH path = (gene_1:Gene{ iri: $startIri })
  - [occ_in_1_2_d:occ_in] -> (publication_2:Publication)
RETURN path