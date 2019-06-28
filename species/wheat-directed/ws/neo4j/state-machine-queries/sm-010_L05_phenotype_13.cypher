MATCH path = (gene_1:Gene{ iri: $startIri })
  - [regulates_1_9_d:regulates] -> (gene_9:Gene)
  - [rel_9_9_3:genetic|physical*0..3] - (gene_9b:Gene)
  - [has_observ_pheno_9_13_d:has_observ_pheno] -> (phenotype_13:Phenotype)
RETURN path