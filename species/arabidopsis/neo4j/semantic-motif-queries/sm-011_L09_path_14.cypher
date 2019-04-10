MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:genetic|physical*0..2] -> (protein_10:Protein)
  - [is_a_10_12:is_a] -> (enzyme_12:Enzyme)
  - [ca_by_12_13:ca_by] -> (reaction_13:Reaction)
  - [part_of_13_14:part_of] -> (path_14:Path)
RETURN path