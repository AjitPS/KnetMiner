package rres.knetminer.datasource.provider;

import rres.knetminer.datasource.ondexlocal.OndexLocalDataSource;

public class Quickstart extends OndexLocalDataSource {

	public Quickstart() {
		super("quickstart", "config.xml", "SemanticMotifs.txt");
	}

}
