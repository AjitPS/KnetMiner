MATCH path = (gene_1:Gene{ iri: $startIri })
  - [enc_1_10:enc] -> (protein_10:Protein)
  - [xref_10_10:xref*0..3] -> (protein_10:Protein)
  - [cat_c_10_12:cat_c] -> (eC_12:EC)
  - [equ_12_3:equ] -> (molFunc_3:MolFunc)
RETURN path