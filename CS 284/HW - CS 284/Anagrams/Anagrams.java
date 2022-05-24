package Homework;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.*;

public class Anagrams {
	final Integer[] primes =  
			{2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 
			31, 37, 41, 43, 47, 53, 59, 61, 67, 
			71, 73, 79, 83, 89, 97, 101};
	Map<Character,Integer> letterTable;
	Map<Long,ArrayList<String>> anagramTable;

	private void buildLetterTable() {
		letterTable = new HashMap<Character,Integer>();
		for(int i=97; i<123; i++)
		{
			letterTable.put((char)i,primes[i-97]);
		}
	}

	Anagrams() {
		buildLetterTable();
		anagramTable = new HashMap<Long,ArrayList<String>>();
	}

	public void addWord(String s) {
		long key = myhashcode(s);
		if(anagramTable.containsKey(key))
		{
			for(int i=0; i<anagramTable.get(key).size(); i++)
			{
				if(anagramTable.get(key).get(i).equals(s))
				{
					throw new IllegalStateException();
				}
			}
			anagramTable.get(key).add(s);
		}
		else
		{
			ArrayList<String> newL = new ArrayList<String>();
			newL.add(s);
			anagramTable.put(key,newL);
		}
	}
	private boolean wordTest(String s)
	{
		if(s.isEmpty())
		{
			return false;
		}
		for(int i=0; i<s.length(); i++)
		{
			if(!Character.isLetter(s.charAt(i)))
			{
				return false;
			}
		}
		return true;
	}
	public long myhashcode(String s) {
		if(!wordTest(s))
		{
			throw new IllegalArgumentException();
		}
		s = s.toLowerCase();
		long total = 1;
		int i = 0;
		while(i<s.length())
		{
			total*=letterTable.get(s.charAt(i));
			i++;
		}
		return total;
	}
	
	public void processFile(String s) throws IOException {
		FileInputStream fstream = new FileInputStream(s);
		BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
		String strLine;
		while ((strLine = br.readLine()) != null)   {
		  this.addWord(strLine);
		}
		br.close();
	}
	
	public ArrayList<Map.Entry<Long,ArrayList<String>>> getMaxEntries() {
		if(anagramTable.isEmpty())
		{
			throw new IllegalStateException();
		}
		int max = 0;
		ArrayList<Map.Entry<Long,ArrayList<String>>> entries = new ArrayList<Map.Entry<Long,ArrayList<String>>>();
		Set s = anagramTable.entrySet();
		Iterator i = s.iterator();
		while(i.hasNext())
		{
			Map.Entry<Long,ArrayList<String>> me = (Map.Entry<Long,ArrayList<String>>)i.next();
			if(me.getValue().size()>max)
			{
				max = me.getValue().size();
				entries.clear();
				entries.add(me);
			}
			else if(me.getValue().size()==max)
			{
				entries.add(me);
			}
		}
		return entries;
	}
	
	public static void main(String[] args) {
		Anagrams a = new Anagrams();
		final long startTime = System.nanoTime();    
		try {
			a.processFile("words_alpha.txt");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		ArrayList<Map.Entry<Long,ArrayList<String>>> maxEntries = a.getMaxEntries();
		final long estimatedTime = System.nanoTime() - startTime;
		final double seconds = ((double) estimatedTime/1000000000);
		System.out.println("Time: "+ seconds);
		System.out.println("List of max anagrams: "+ maxEntries);
	}
}
