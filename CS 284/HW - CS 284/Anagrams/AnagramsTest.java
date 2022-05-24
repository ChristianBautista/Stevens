package Homework;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.Before;

class AnagramsTest 
{
	Anagrams noAna = new Anagrams();
	Anagrams oneAna = new Anagrams();
	Anagrams twoAna = new Anagrams();
	Anagrams dummy = new Anagrams();
	@Before
	void init()
	{
		noAna.addWord("none");
		noAna.addWord("of");
		noAna.addWord("these");
		noAna.addWord("are");
		noAna.addWord("anagrams");
		oneAna.addWord("leaf");
		oneAna.addWord("flea");
		oneAna.addWord("gibberish");
		oneAna.addWord("filler");
		twoAna.addWord("leaf");
		twoAna.addWord("flea");
		twoAna.addWord("listen");
		twoAna.addWord("silent");
		twoAna.addWord("gibberish");
		twoAna.addWord("filler");
	}
	
	@Test
	void hashcodeTest() 
	{
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode(""));
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode(" "));
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode("1"));
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode("a b c"));
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode("abc123"));
		assertThrows(IllegalArgumentException.class, () -> dummy.myhashcode("FA1L"));
		assertEquals(dummy.myhashcode("test"),3715217);
		assertEquals(dummy.myhashcode("TEST"),3715217);
		assertEquals(dummy.myhashcode("Comp"),510655);
		assertEquals(dummy.myhashcode("uter"),3477793);
		assertEquals(dummy.myhashcode("Sci"),7705);
		assertEquals(dummy.myhashcode("ence"),26015);
	}
	@Test
	void addandmaxTest()
	{
		assertEquals(oneAna.getMaxEntries(),"[10582=[leaf, flea]");
		assertEquals(twoAna.getMaxEntries(),"[[10582=[leaf, flea], [1914801911=listen, silent]]");
	}
}
