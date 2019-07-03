MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10_d:enc] -> (protein_10:Protein)
  - [xref_10_10:xref*0..1] - (protein_10b:Protein)
  - [has_domain_10_11_d:has_domain] -> (protDomain_11:ProtDomain)
  - [has_function_11_3_d:has_function] -> (molFunc_3:MolFunc)
RETURN path