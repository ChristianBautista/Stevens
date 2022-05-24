package SpecialAssignment;

import java.util.ArrayList;
import java.util.List;

public class ListCollection<E> {
  private int nodeCount;
  protected List<SingleLL<E>> collection;

  /**
   * Base constructor, initializes an empty ListCollection.
   */
  public ListCollection() {
	  this.nodeCount = 0;
	  this.collection = new ArrayList<SingleLL<E>>();
  }

  /**
   * Initializes a ListCollection with `numLists` lists.
   * 
   * @param numLists
   */
  public ListCollection(int numLists) {
	  if(numLists<0)
	  {
		  throw new IllegalArgumentException();
	  }
	  collection = new ArrayList<SingleLL<E>>();
	  this.nodeCount = 0;
	  for(int i=0; i<numLists; i++)
	  {
		  collection.add(new SingleLL<E>());
	  }
  }

  /**
   * @return The size of the `ListCollection`
   */
  public int size() {
	  return collection.size();
  }

  /**
   * Sets the nodeCount
   * 
   * @param nodeCount
   */
  public void setNodeCount(int nodeCount) {
	  if(nodeCount<0)
	  {
		  throw new IllegalArgumentException();
	  }
	  this.nodeCount = nodeCount;
  }

  /**
   * @return the nodeCount
   */
  public int getNodeCount() {
	  return nodeCount;
  }

  /**
   * Adds the specified `SingleLL` to the end of the `ListCollection`
   * 
   * @param list
   */
  public void addList(SingleLL<E> list) {
	  collection.add(list);
	  nodeCount += list.size();
  }

  /**
   * Adds the specified `List` to the `ListCollection`
   * 
   * @param list
   * @complexity Your big-o and supporting explanation here
   * O(n) or linear.
   * The first part of the method is constant, considering it is two statements which create or modify variables.
   * However, the for each loop traverses the list given and thus, makes it linear.
   */
  public void addList(List<E> list) {
	  nodeCount += list.size();
	  SingleLL<E> res = new SingleLL<E>();
	  for(E e : list)
	  {
		  res.append(e);
	  }
	  collection.add(res);
  }

  /**
   * Returns the list at the specified index
   * 
   * @throws IllegalArgumentException when index out of bounds
   * @param listIndex
   * @return the list
   */
  public SingleLL<E> getList(int listIndex) {
	  if(listIndex<0 || listIndex>=collection.size())
	  {
		  throw new IllegalArgumentException();
	  }
	  return collection.get(listIndex);
  }

  /**
   * Adds an element to the `elemIndex` position of the list at `listIndex`
   * 
   * @throws IllegalArgumentException when index out of bounds
   * @param listIndex
   * @param elemIndex
   * @param elem
   * @complexity Your big-o and supporting explanation here
   * O(n) or linear.
   * The first part of the method is constant considering the fact that it is only an initialization and an if statement.
   * However, the insert method traverses the list selected therefore, it is linear.
   */
  public void addElem(int listIndex, int elemIndex, E elem) {
	  SingleLL<E> list = getList(listIndex);
	  if(elemIndex<0 || elemIndex>list.size())
	  {
		  throw new IllegalArgumentException("Index Out Of Bounds");
	  }
	  list.insert(elemIndex, elem);
  }

  /**
   * Sets the element at the `elemIndex` position of the list at `listIndex`
   * 
   * @throws IllegalArgumentException when index out of bounds
   * @param listIndex
   * @param elemIndex
   * @param elem
   */
  public void setElem(int listIndex, int elemIndex, E elem) {
	  SingleLL<E> list = getList(listIndex);
	  if(elemIndex<0 || elemIndex>=list.size())
	  {
		  throw new IllegalArgumentException("Index Out Of Bounds");
	  }
	  list.set(elemIndex, elem);
  }

  /**
   * Returns the element at the `elemIndex` position of the list at `listIndex`
   * 
   * @throws IllegalArgumentException when index out of bounds
   * @param listIndex
   * @param elemIndex
   * @return
   */
  public E getElem(int listIndex, int elemIndex) {
	  SingleLL<E> list = getList(listIndex);
	  if(elemIndex<0 || elemIndex>=list.size())
	  {
		  throw new IllegalArgumentException("Index Out Of Bounds");
	  }
	  return list.get(elemIndex);
  }

  /**
   * Returns the `ListCollection` in string form, following STRICTLY the rule of
   * "[LIST1, LIST2, LIST3, ... ]" Ex: [[0, 1, 2], [3, 4, 5] [6, 7, 8]]
   */
  public String toString() {
	  StringBuilder sb = new StringBuilder();
	  sb.append("[");
	  for(int i=0; i<collection.size(); i++)
	  {
		  sb.append(collection.get(i) + (i+1 != collection.size() ? ", " : ""));
	  }
	  sb.append("]");
	  return sb.toString();
  }
}
