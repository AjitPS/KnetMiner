MATCH path = (g1:Gene{ iri: $startIri }) - [cooc1:cooc_wi] -> (to1:TO) - [cooc2:cooc_wi] -> (g2:Gene)
WHERE g1 <> g2 
RETURN path
