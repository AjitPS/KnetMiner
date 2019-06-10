MATCH path = (gene_1:Gene{ iri: $startIri })
  - [homoeolog_1_9:homoeolog] - (gene_9:Gene)
  - [rel_9_9_d_3:genetic|physical*0..3] -> (gene_9b:Gene)
  - [has_variation_9_20_d:has_variation] -> (sNP_20:SNP)
  - [leads_to_20_26_d:leads_to] -> (sNPEffect_26:SNPEffect)
RETURN path