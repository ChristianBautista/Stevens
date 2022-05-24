package SpecialAssignment;

public class ListMatrix extends ListCollection<Integer> {
	  private int rows;
	  private int columns;

	  /**
	   * Initializes a `ListMatrix` with the specified number of rows and columns. By
	   * default, ALL elements are set to 0.
	   * 
	   * @param rows
	   * @param columns
	   */
	  public ListMatrix(int rows, int columns) {
		  super(rows);
		  if(rows<=0 || columns <=0)
		  {
			  throw new IllegalArgumentException();
		  }
		  this.rows = rows;
		  this.columns = columns;
		  this.setNodeCount(rows*columns);
		  for(int i=0; i<rows; i++)
		  {
			  for(int j=0; j<columns; j++)
			  {
				  addElem(i,j,0);
			  }
		  }
	  }

	  /**
	   * @return the number of rows
	   */
	  public int numRows() {
	    return this.rows;
	  }

	  /**
	   * 
	   * @return the number of columns
	   */
	  public int numColumns() {
	    return this.columns;
	  }

	  /**
	   * Adds the `ListMatrix` to `ListMatrix other`, storing the result in the caller
	   * (this)
	   * 
	   * @throws IllegalArgumentException if dimensions do not properly coincide
	   * @param other
	   * @complexity Your big-o and supporting explanation here
	   * O(mn^2).
	   * The first part of the method is constant, since it is just an if statement.
	   * The next part comprises of two loops, which will run as long as rows * columns, hence mn.
	   * However, I'm accounting for the fact that the body of the inner loop is traversing the list itself, therefore, it is squared.
	   */
	  public void add(ListMatrix other) {
		  if((rows!=other.numRows()) || (columns!=other.numColumns()))
		  {
			  throw new IllegalArgumentException();
		  }
		  for(int i=0; i<rows; i++)
		  {
			  for(int j=0; j<columns; j++)
			  {
				  this.setElem(i, j, (this.getElem(i, j)+other.getElem(i, j)));
			  }
		  }
	  }

	  /**
	   * Returns the transpose of the matrix
	   * 
	   * @param matrix
	   * @return matrix transpose
	   */
	  public static ListMatrix transpose(ListMatrix matrix) {
		  ListMatrix res = new ListMatrix(matrix.numColumns(), matrix.numRows());
		  for(int i=0; i<matrix.numColumns(); i++)
		  {
			  for(int j=0; j<matrix.numRows(); j++)
			  {
				  res.setElem(i, j, matrix.getElem(j, i));
			  }
		  }
		  return res;
	  }

	  /**
	   * Multiplies the `ListMatrix` with `ListMatrix other`, returning the result as
	   * a new `ListMatrix.
	   * 
	   * @throws IllegalArgumentException if dimensions do not peoperly coincide
	   * @param other
	   * @return
	   */
	  public ListMatrix multiply(ListMatrix other) {
		  if(columns!=other.rows)
		  {
			  throw new IllegalArgumentException();
		  }
		  ListMatrix result = new ListMatrix(rows, other.numColumns());
		  for(int i=0; i<result.numRows(); i++)
		  {
			  for(int j=0; j<result.columns; j++)
			  {
				  for(int k=0; k<other.numRows(); k++)
				  {
					  result.setElem(i, j, result.getElem(i, j) + (this.getElem(i, k) * other.getElem(k, j)));
				  }
			  }
		  }
		  return result;
	  }
}
