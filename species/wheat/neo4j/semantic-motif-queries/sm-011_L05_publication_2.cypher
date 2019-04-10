MATCH path = (gene_1:Gene{ iri: $startIri })
  - [rel_1_9:homoeolog|regulates] -> (gene_9:Gene)
  - [rel_9_9_3:genetic|physical*0..3] -> (gene_9b:Gene)
  - [pub_in_9_2:pub_in] -> (publication_2:Publication)
RETURN path