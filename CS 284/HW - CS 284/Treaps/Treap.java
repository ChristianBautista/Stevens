package Homework;

import java.util.*;
public class Treap<E extends Comparable<E>>
{
	private static class Node<E>
	{
		public E data;
		public int priority;
		public Node<E> left;
		public Node<E> right;
		
		public Node(E data, int priority)
		{
			if(data==null)
			{
				throw new IllegalArgumentException();
			}
			this.data = data;
			this.priority = priority;
			left = null;
			right = null;
		}
		Node<E> rotateRight()
		{
			Node<E> X = this.left;
			Node<E> Y = this.left.right;
			
			X.right = this;
			this.left = Y;
			
			return X;
		}
		Node<E> rotateLeft()
		{
			Node<E> X = this.right;
			Node<E> Y = this.right.left;
			
			X.left = this;
			this.right = Y;
			
			return X;
		}
	}
	private Random priorityGenerator;
	private Node<E> root;
	List<E> keys = new ArrayList<E>();
	List<Integer> priorities = new ArrayList<Integer>();
	
	public Treap()
	{
		priorityGenerator = new Random();
		root = null;
	}
	public Treap(long seed)
	{
		priorityGenerator = new Random(seed);
		root = null;
	}
	boolean add(E key)
	{
		int priority = priorityGenerator.nextInt();
		while(priorities.indexOf(priority)!=-1)
		{
			priority = priorityGenerator.nextInt();
		}
		return add(key,priority);
	}
	boolean add(E key, int priority)
	{
		if(root==null && keys.size()==0 && priorities.size()==0)
		{
			root = new Node<E>(key,priority);
			keys.add(key);
			priorities.add(priority);
			return true;
		}
		if(keys.indexOf(key)!=-1 || priorities.indexOf(priority)!=-1)
		{
			return false;
		}
		int direction = 0;
		Node<E> current = root;
		List<Node<E>> stack = new ArrayList<Node<E>>();
		while(current!=null)
		{
			stack.add(0,current);
			if(key.compareTo(current.data)<0)
			{
				direction = -1;
				current = current.left;
			}
			else
			{
				direction = 1;
				current = current.right;
			}
		}
		current = new Node<E>(key,priority);
		keys.add(key);
		priorities.add(priority);
		if(direction==1)
		{
			stack.get(0).right = current;
		}
		else
		{
			stack.get(0).left = current;
		}
		while(stack.size()!=0)
		{
			current = stack.get(0);
			if(current.left!=null && current.left.priority>current.priority)
			{
				if(stack.size()>1)
				{
					if(stack.get(1).right==current)
					{
						stack.get(1).right = current.rotateRight();
					}
					else
					{
						stack.get(1).left = current.rotateRight();
					}
				}
				else
				{
					root = current.rotateRight();
				}
			}
			else if(current.right!=null && current.right.priority>current.priority)
			{
				if(stack.size()>1)
				{
					if(stack.get(1).right==current)
					{
						stack.get(1).right = current.rotateLeft();
					}
					else
					{
						stack.get(1).left = current.rotateLeft();
					}
				}
				else
				{
					root = current.rotateLeft();
				}
			}
			else
			{
				stack.clear();
				break;
			}
			stack.remove(0);
		}
		return true;
	}
	boolean delete(E key)
	{
		if(root==null || keys.indexOf(key)==-1)
		{
			return false;
		}
		priorities.remove(keys.indexOf(key));
		keys.remove(key);
		if(priorities.size()==0 && keys.size()==0 && root.data==key)
		{
			root = null;
		}
		int direction = 0;
		Node<E> current = root;
		Node<E> prev = null;
		while(current.data!=key)
		{
			prev = current;
			if(key.compareTo(current.data)<0)
			{
				current = current.left;
				direction = -1;
			}
			else
			{
				current = current.right;
				direction = 1;
			}
		}
		while(current.left!=null || current.right!=null)
		{
			if(current.left!=null && current.right!=null)
			{
				int lP = current.left.priority;
				int rP = current.right.priority;
				if(prev==null)
				{
					root = (lP>rP)? current.rotateRight() : current.rotateLeft();
					current = (lP>rP)? root.right : root.left;
					prev = root;
				}
				else if(direction==-1)
				{
					prev.left = (lP>rP)? current.rotateRight() : current.rotateLeft();
					current = (lP>rP)? prev.left.right : prev.left.left;
					prev = prev.left;
				}
				else
				{
					prev.right = (lP>rP)? current.rotateRight() : current.rotateLeft();
					current = (lP>rP)? prev.right.right : prev.right.left;
					prev = prev.right;
				}
				direction = (lP>rP)? 1 : -1;
			}
			else if(current.left!=null && current.right==null)
			{
				if(prev==null)
				{
					root = current.rotateRight();
					current = root.right;
					prev = root;
				}
				else if(direction==-1)
				{
					prev.left = current.rotateRight();
					current = prev.left.right;
					prev = prev.left;
				}
				else
				{
					prev.right = current.rotateRight();
					current = prev.right.right;
					prev = prev.right;
				}
				direction = 1;
			}
			else
			{
				if(prev==null)
				{
					root = current.rotateLeft();
					current = root.left;
					prev = root;
				}
				else if(direction==-1)
				{
					prev.left = current.rotateLeft();
					current = prev.left.left;
					prev = prev.left;
				}
				else
				{
					prev.right = current.rotateLeft();
					current = prev.right.left;
					prev = prev.right;
				}
				direction = -1;
			}
		}
		if(direction==-1)
		{
			prev.left = null;
		}
		else
		{
			prev.right = null;
		}
		return true;
	}
	private boolean find(Node<E> root, E key)
	{
		if(root==null)
		{
			return false;
		}
		if(root.data==key)
		{
			return true;
		}
		if(key.compareTo(root.data)<0)
		{
			return find(root.left,key);
		}
		return find(root.right,key);
	}
	public boolean find(E key)
	{
		return find(root,key);
	}
	private StringBuilder toString(Node<E> current, int i) {
		StringBuilder r = new StringBuilder() ;
		for(int j=0; j<i; j++) 
		{
			r.append("  ");
		}
		
		if(current==null) 
		{
			r.append("null\n");
		} 
		else 
		{
			r.append("(key="+current.data.toString()+", priority="+current.priority+")\n");
			r.append(toString(current.left,i+1));
			r.append(toString(current.right,i+1));
		}
		return r;	
	}
	public String toString()
	{
		return toString(root,0).toString();
	}
	public static void main(String[]args)
	{
		Treap<Integer> t1 = new Treap<Integer>();
		t1.add(4,14);
		t1.add(2,31);
		System.out.println(t1);
	}
}
