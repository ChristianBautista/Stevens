//Christian Bautista
//I pledge my honor that I have abided by the Stevens Honor System.

package Homework;

import java.util.ArrayList;

public class IDLList<E> 
{
	private static class Node<E> 
	{
		//data fields
		private E data;
		private Node<E> next;
		private Node<E> prev;
		
		//constructors
		public Node(E data) 
		{
			super();
			this.data = data;
		}
		public Node(E data, Node<E> prev, Node<E> next) 
		{
			super();
			this.data = data;
			this.prev = prev;
			this.next = next;
		}
	}
	//data fields
	private Node<E> head;
	private Node<E> tail;
	private int size;
	private ArrayList<Node<E>> indices;
		
	//constructor
	IDLList()
	{
		head = null;
		tail = null;
		size = 0;
		indices = new ArrayList<Node<E>>();
	}
		
	//methods
	public boolean add(int index, E elem)
	{
		if(index<0 || index>size) 
		{
			throw new IndexOutOfBoundsException();
		}
		Node<E> temp = new Node<E>(elem);
		if(head==null)
		{
			head = temp;
			tail = temp;
			indices.add(temp);
		}
		else if(index==0) 
		{			
			temp.next = head;
			head.prev = temp;
			head = temp;
			indices.add(0,temp);
		}
		else if(index==size) 
		{ 	
			temp.prev = tail;
			tail.next = temp;
			tail = temp;
			indices.add(temp);
		}
		else 
		{					
			Node<E> current = head;
			for (int i=1; i<index; i++)
			{
				current = current.next;
			}
			temp.next = current.next;
			current.next = temp;
			temp.prev = current;
			temp.next.prev = temp;
			indices.add(index,temp);
		}
		size++;
		return true;
	}
	public boolean add (E elem)
	{
		return add(0,elem);
	}
	public boolean append (E elem)
	{
		return add(size,elem);
	}
	public E get (int index)
	{
		if(index<0 || index>=size)
		{
			throw new IndexOutOfBoundsException();
		}
		return indices.get(index).data;
	}
	public E getHead ()
	{
		if(size==0)
		{
			throw new IllegalStateException();
		}
		return head.data;
	}
	public E getLast ()
	{
		if(size==0)
		{
			throw new IllegalStateException();
		}
		return tail.data;
	}
	public int size()
	{
		return size;
	}
	public E remove ()
	{
		return removeAt(0);
	}
	public E removeLast ()
	{
		return removeAt(size-1);
	}
	public E removeAt (int index)
	{
		if(index<0 || index>size || head==null) 
		{
			throw new IllegalStateException();
		}
		
		if(index==0) 
		{		
			Node<E> temp = head;
			if(size==1)
			{
				head = null;
				tail = null;
				indices.remove(index);
				size = 0;
				return temp.data;
			}
			head = head.next;
			head.prev = null;
			size--;
			return temp.data;
		}
		else if(index==size-1)
		{
			Node<E> temp = tail;
			tail = tail.prev;
			tail.next = null;
			size--;
			return temp.data;
		}
		else 
		{					
			Node<E> current = head;
			int i = 0;
			while(i<index)
			{
				current = current.next;
				i++;
			}
			current.prev.next = current.next;
			current.next.prev = current.prev;
			indices.remove(index);
			size--;
			return current.data;
		}
	}
	public boolean remove (E elem)
	{
		if(head==null)
		{
			throw new IllegalStateException();
		}
		Node<E> current = head;
		int i = 0;
		while(i<size)
		{
			if(current.data==elem)
			{
				removeAt(i);
				return true;
			}
			current = current.next;
			i++;
		}
		return false;
	}
	public String toString()
	{
		StringBuilder s = new StringBuilder();
		s.append("[");
		for(int i=0; i<size; i++)
		{
			s.append(indices.get(i).data.toString()+",");
		}
		s.append("]");
		return s.toString();
	}
}
