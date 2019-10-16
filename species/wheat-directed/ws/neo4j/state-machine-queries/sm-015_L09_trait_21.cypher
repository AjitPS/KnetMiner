MATCH path = (gene_1:Gene{ iri: $startIri })
  - [rel_1_9:homoeolog|regulates] - (gene_9:Gene)
  - [rel_9_9_3:genetic|physical*0..3] - (gene_9b:Gene)
  - [has_variation_9_20_d:has_variation] -> (sNP_20:SNP)
  - [associated_with_20_211_d:associated_with] -> (trait_211:Trait)
  - [is_part_of_211_21:is_part_of] - (trait_21:Trait)
RETURN path