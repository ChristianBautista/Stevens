package SpecialAssignment2;

import java.util.ArrayList;

/**
 * BSFamilyTree creates a tree for specific families. 
 */
public class BSFamilyTree {
    //Data Fields
    private FamilyTreeNode root;
    private ArrayList<String> numbers;

    /**
     * Constructor: constructs an empty BSFamilyTree
     */
    public BSFamilyTree() {
        root = null;
    }

    /**
     * takes in the last name and returns true if there
     * is a FamilyTreeNode with the given last name.
     */
    private boolean doesFamilyExistHelper(String lastName, FamilyTreeNode current)
    {
    	if(current == null)
    	{
    		return false;
    	}
    	else if(current.getLastName().equals(lastName))
    	{
    		return true;
    	}
    	else
    	{
    		if(lastName.compareTo(current.getLastName())<0)
    		{
    			return doesFamilyExistHelper(lastName,current.left);
    		}
    		else
    		{
    			return doesFamilyExistHelper(lastName,current.right);
    		}
    	}
    }
    public boolean doesFamilyExist(String lastName) {
    	if(lastName == null || root == null)
    	{
    		return false;
    	}
        return doesFamilyExistHelper(lastName,root);
    }

    /**
     * Takes in a last name and creates a new instance of
     * FamilyTreeNode and adds it to the BSFamilyTree.
     */
    private FamilyTreeNode addFamilyTreeNodeHelper(String lastName, FamilyTreeNode current)
    {
    	if(current == null)
    	{
    		current = new FamilyTreeNode(lastName);
    		return current;
    	}
    	else if(lastName.compareTo(current.getLastName())<0)
    	{
    		current.left = addFamilyTreeNodeHelper(lastName,current.left);
    	}
    	else
    	{
    		current.right = addFamilyTreeNodeHelper(lastName,current.right);
    	}
    	return current;
    }
    public void addFamilyTreeNode(String lastName) {
    	if(doesFamilyExist(lastName))
    	{
    		throw new IllegalArgumentException();
    	}
    	else if(root == null)
    	{
    		root = new FamilyTreeNode(lastName);
    	}
    	else
    	{
    		root = addFamilyTreeNodeHelper(lastName,root);
    	}
    }

    /**
     * Takes a last name and then finds that specific
     * family tree and then returns that FamilyTreeNode
     * If last name is not in tree, throws an exception.
     */
    private FamilyTreeNode getFamilyTreeNodeHelper(String lastName, FamilyTreeNode current)
    {
    	if(current.getLastName().equals(lastName))
    	{
    		return current;
    	}
    	else
    	{
    		if(lastName.compareTo(current.getLastName())<0)
    		{
    			return getFamilyTreeNodeHelper(lastName,current.left);
    		}
    		else
    		{
    			return getFamilyTreeNodeHelper(lastName,current.right);
    		}
    	}
    }
    public FamilyTreeNode getFamilyTreeNode(String lastName) {
        if(!doesFamilyExist(lastName))
        {
        	throw new IllegalArgumentException();
        }
        else
        {
        	return getFamilyTreeNodeHelper(lastName,root);
        }
    }

    /**
     * Returns true if the input phone number exists in the BSFamilyTree
     * false otherwise.
     */
    public ArrayList<String> getNumbers()
    {
    	numbers = new ArrayList<String>();
    	getNumbers(root);
    	return numbers;
    }
    private void getNumbers(FamilyTreeNode current)
    {
    	if(current == null)
    	{
    		return;
    	}
    	else
    	{
    		for(int i=0; i<current.getMembers().size(); i++)
    		{
    			numbers.add(current.getMembers().get(i).getPhoneNumber());
    		}
    		getNumbers(current.left);
    		getNumbers(current.right);
    	}
    }
    public boolean doesNumberExist(String phoneNumber) {
        if(phoneNumber == null)
        {
        	return false;
        }
        numbers = new ArrayList<String>();
        getNumbers(root);
        if(numbers.contains(phoneNumber))
        {
        	return true;
        }
        else
        {
        	return false;
        }
    }

    /**
     * Returns the string representation of the BSFamilyTree
     */
    private StringBuilder toString(FamilyTreeNode current, int i) {
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
			r.append(current.toString()+"\n");
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
		BSFamilyTree test = new BSFamilyTree();
		test.addFamilyTreeNode("Smith");
		//System.out.println(test.doesFamilyExist("Smith"));
		test.addFamilyTreeNode("Johnson");
		System.out.println(test);
	}
}