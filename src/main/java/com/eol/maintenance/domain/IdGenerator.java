package com.eol.maintenance.domain;



public class IdGenerator {
	private static final int CACHESIZE = 100000;
	private static int counter = 0;
	private static long[] uuidCache = new long[CACHESIZE];
	public static long createUUID() {
		long theUUID;
		if (counter == 0) getNextBatch();
		theUUID = uuidCache[counter];
		counter++;
		if (counter >= CACHESIZE) counter = 0;
		return theUUID;
	}
	private static void getNextBatch() {
		for (int i=0;i<CACHESIZE;i++) {
			uuidCache[i] = java.util.UUID.randomUUID().getLeastSignificantBits();
		}
	}
}