package SpecialAssignment2;

import java.util.ArrayList;
import java.util.List;

public class FamilyTreeNode {
	// Data fields
	private String lastName;
	private List<Person> members;
	public FamilyTreeNode left;
	public FamilyTreeNode right;

	/**
     	* Constructor: instantializes a new FamilyTreeNode
     	* given a lastName
     	*/
	public FamilyTreeNode(String lastName) {
		this.lastName = lastName;
		members = new ArrayList<Person>();
		left = null;
		right = null;
	}

	/**
     	* Returns the last name of the FamilyTreeNode
     	*/
	public String getLastName() {
		return lastName;
	}

	/**
     	* Returns the arraylist of members in the FamilyTreeNode
     	*/
	public List<Person> getMembers() {
		return members;
	}

	/*
	 * Returns true if there is an instance of Person in the FamilyTreeNode that has
	 * the same first and last name provided Return false otherwise
	 */
	public boolean doesFamilyMemberExist(String lastName, String firstName) {
        if(!this.lastName.equals(lastName) || firstName == null)
        {
        	return false;
        }
        else
        {
        	for(int i=0; i<members.size(); i++)
        	{
        		if(members.get(i).getFirstName().equals(firstName))
        		{
        			return true;
        		}
        	}
        	return false;
        }
	}

	/**
	 * Returns true if there is an instance of Person in the FamilyTreeNode whose
	 * phone number matches the one provided Returns false otherwise
	 */
	public boolean doesNumberExist(String phoneNumber) {
		if(phoneNumber == null)
		{
			return false;
		}
        for(int i=0; i<members.size(); i++)
        {
        	if(members.get(i).getPhoneNumber().equals(phoneNumber))
        	{
        		return true;
        	}
        }
        return false;
	}

	/*
	 * Adds a Person to this FamilyTreeNode
	 * Throw an exception if the last name provided does not match the last name of the FamilyTreeNode
	 */
	public void addFamilyMember(String lastName, String firstName, String phoneNumber) {
		if(!this.lastName.equals(lastName) || doesFamilyMemberExist(lastName,firstName) || doesNumberExist(phoneNumber))
		{
			throw new IllegalArgumentException();
		}
		Person temp = new Person(lastName,firstName,phoneNumber);
		members.add(temp);
	}

	/**
	 * Adds a Person to this FamilyTreeNode
	 * Throw an exception if the last name provided does not match the last name of the FamilyTreeNode
	 */
	public void addFamilyMember(Person person) {
		if(!this.lastName.equals(person.getLastName()) || doesFamilyMemberExist(person.getLastName(),person.getFirstName()) || doesNumberExist(person.getPhoneNumber()))
		{
			throw new IllegalArgumentException();
		}
		members.add(person);
	}

	/*
	 * Returns the phone number of the person in the family with the given phone
	 * number Returns "Does not exist." if not found
	 */
	public String getPhoneNumberOfFamilyMember(String lastName, String firstName) {
		if(!doesFamilyMemberExist(lastName,firstName))
		{
			return "Does not exist.";
		}
		else
		{
			int i = 0;
			while(!members.get(i).getFirstName().equals(firstName))
			{
				i++;
			}
			return members.get(i).getPhoneNumber();
		}
	}

	/*
	 * toString method Ex: [] [John Smith (5551234567), May Smith (5551234568),
	 * April Smith (5551234569), August Smith (5551234570)]
	 */
	public String toString() {
		return members.toString();
	}
}