MATCH path = (gene_1:Gene)
  - [ortho_1_2:ortho] - (gene_2:Gene)
  - [enc_2_3:enc] - (protein_3:Protein)
  - [it_wi_3_3:it_wi*0..1] - (protein_3b:Protein)
  - [pub_in_3_6:pub_in] - (publication_6:Publication)
WHERE gene_1.iri IN $startGeneIris
RETURN path