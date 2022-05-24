package SpecialAssignment2;

import java.util.HashMap;
import java.util.Map;
import java.util.ArrayList;

public class PhoneBook {
	// Data fields
	public Map<Character,BSFamilyTree> directory;
	private ArrayList<String> numbers;

	/**
     	* Creates a new phone book with an empty directory.
     	*/
	public PhoneBook() {
		directory = new HashMap<Character,BSFamilyTree>();
		for(int i=65; i<91; i++)
		{
			directory.put((char)i,new BSFamilyTree());
		}
	}

	/*
	 * Returns the instance of BSFamilyTree at the indicated letter
	 * Must accept lowercase letters as well as uppercase letters
	 */
	public BSFamilyTree getFamilyTree(char letter) {
		if(!Character.isLetter(letter))
		{
			throw new IllegalArgumentException();
		}
		return directory.get(Character.toUpperCase(letter));
	}

	/*
	 * Adds a FamilyTreeNode to the PhoneBook
	 */
	public void addFamily(String lastName) {
		if(lastName == null)
		{
			throw new IllegalArgumentException();
		}
		char c = Character.toUpperCase(lastName.charAt(0));
		if(directory.get(c).doesFamilyExist(lastName))
		{
			throw new IllegalArgumentException();
		}
		directory.get(c).addFamilyTreeNode(lastName);
	}

	/*
	 * Adds a Person to the PhoneBook
	 * If a FamilyTreeNode with the given last name doesn't currently exist, create the FamilyTreeNode
	 */
	private void getNumbers()
	{
		for(int i=65; i<91; i++)
		{
			ArrayList<String> temp = directory.get((char)i).getNumbers();
			for(int j=0; j<temp.size(); j++)
			{
				numbers.add(temp.get(j));
			}
		}
	}
	public void addPerson(String lastName, String firstName, String phoneNumber) {
		numbers = new ArrayList<String>();
		getNumbers();
		if(lastName == null || numbers.contains(phoneNumber))
		{
			throw new IllegalArgumentException();
		}
		char c = Character.toUpperCase(lastName.charAt(0));
		if(!directory.get(c).doesFamilyExist(lastName))
		{
			directory.get(c).addFamilyTreeNode(lastName);
		}
		FamilyTreeNode family = directory.get(c).getFamilyTreeNode(lastName);
		if(family.doesFamilyMemberExist(lastName, firstName))
		{
			throw new IllegalArgumentException();
		}
		family.addFamilyMember(lastName, firstName, phoneNumber);
	}

	/*
	 * Finds the phone number of a person
	 * Returns 'Does not exist.' if not found.
	 */
	public String getPhoneNumber(String lastName, String firstName) {
		if(lastName == null)
		{
			return "Does not exist.";
		}
		char c = Character.toUpperCase(lastName.charAt(0));
		if(!directory.get(c).doesFamilyExist(lastName))
		{
			return "Does not exist.";
		}
		return directory.get(c).getFamilyTreeNode(lastName).getPhoneNumberOfFamilyMember(lastName, firstName);
	}

    	/**
     	* String representation of PhoneBook
     	*/
	public String toString() {
		String res = "";
		for(int i=65; i<91; i++)
		{
			BSFamilyTree temp = directory.get((char)i);
			res += Character.toString((char)i)+"\n"+temp.toString();
		}
		return res;
	}
}