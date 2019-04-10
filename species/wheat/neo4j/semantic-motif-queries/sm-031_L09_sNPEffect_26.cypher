MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [rel_10_10:h_s_s|ortho*0..1] -> (protein_10b:Protein)
  - [enc_10_9:enc] -> (gene_9:Gene)
  - [rel_9_9_2:genetic|physical*0..2] -> (gene_9b:Gene)
  - [has_variation_9_20:has_variation] -> (sNP_20:SNP)
  - [leads_to_20_26:leads_to] -> (sNPEffect_26:SNPEffect)
RETURN path