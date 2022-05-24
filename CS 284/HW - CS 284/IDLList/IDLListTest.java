//Christian Bautista
//I pledge my honor that I have abided by the Stevens Honor System.

package Homework;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class IDLListTest {
	IDLList<Integer> li = new IDLList<>();
	IDLList<Integer> dummy = new IDLList<>();
	
	@Test
	void fullTest() 
	{
		//adders test
		assertEquals(li.add(0), true);
		assertEquals(li.append(2), true);
		assertEquals(li.add(1,1), true);
		assertThrows(IndexOutOfBoundsException.class, () -> li.add(-1,-1));
		assertThrows(IndexOutOfBoundsException.class, () -> li.add(5,5));
		assertEquals(li.toString(), "[0,1,2,]");
		
		//getters test
		assertEquals(li.get(1), 1);
		assertEquals(li.getHead(), 0);
		assertEquals(li.getLast(), 2);
		assertThrows(IndexOutOfBoundsException.class, () -> dummy.get(0));
		assertThrows(IllegalStateException.class, () -> dummy.getHead());
		assertThrows(IllegalStateException.class, () -> dummy.getLast());
		assertEquals(li.size(), 3);
		assertEquals(dummy.size(), 0);
		
		//removers test
		assertEquals(li.removeAt(1), 1);
		assertEquals(li.removeLast(), 2);
		assertEquals(li.remove(), 0);
		assertEquals(li.add(0), true);
		assertEquals(li.remove(-1), false);
		assertEquals(li.remove(0), true);	
		assertThrows(IllegalStateException.class, () -> dummy.removeAt(0));
		assertThrows(IllegalStateException.class, () -> dummy.removeLast());
		assertThrows(IllegalStateException.class, () -> dummy.remove());
		assertThrows(IllegalStateException.class, () -> dummy.remove(-1));
	}

	

}
