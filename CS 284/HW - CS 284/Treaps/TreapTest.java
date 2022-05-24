package Homework;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class TreapTest 
{
	//NOTE: Random is not able to be properly tested for obvious reasons
	//construct trees
	Treap<Integer> blank = new Treap<Integer>();
	Treap<Integer> t1 = new Treap<Integer>();
	
	@Test
	void baseTest()
	{
		assertEquals(blank.toString(),"null\n");
		assertEquals(t1.toString(),"null\n");
		assertEquals(blank.find(0),false);
		assertEquals(t1.find(0),false);
		assertEquals(blank.delete(0),false);
		assertEquals(t1.delete(0),false);
	}
	@Test
	void fullTest()
	{
		//addTest
		assertEquals(t1.add(4,14),true);
		assertEquals(t1.add(2,31),true);
		assertEquals(t1.add(6,70),true);
		assertEquals(t1.add(1,84),true);
		assertEquals(t1.add(3,12),true);
		assertEquals(t1.add(5,83),true);
		assertEquals(t1.add(7,26),true);
		assertEquals(t1.add(1,84),false);
		assertEquals(t1.add(2,1),false);
		assertEquals(t1.add(10,14),false);
		//findTest
		assertEquals(t1.find(1),true);
		assertEquals(t1.find(2),true);
		assertEquals(t1.find(3),true);
		assertEquals(t1.find(11),false);
		assertEquals(t1.find(12),false);
		assertEquals(t1.find(13),false);
		//deleteTest
		assertEquals(t1.delete(1),true);
		assertEquals(t1.delete(2),true);
		assertEquals(t1.delete(3),true);
		assertEquals(t1.delete(1),false);
		assertEquals(t1.delete(2),false);
		assertEquals(t1.delete(3),false);
	}
}
