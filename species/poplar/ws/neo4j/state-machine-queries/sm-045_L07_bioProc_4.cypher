MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] - (protein_10:Protein)
  - [xref_10_10_2:xref*0..2] - (protein_10b:Protein)
  - [has_domain_10_11:has_domain] - (protDomain_11:ProtDomain)
  - [participates_in_11_4:participates_in] - (bioProc_4:BioProc)
RETURN path