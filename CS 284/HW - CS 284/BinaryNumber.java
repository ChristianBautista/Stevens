package Homework;

public class BinaryNumber
{
	private int[] data;
	private int length;
	
	public BinaryNumber(int length)
	{
		if(length > 0)
		{
			this.length = length;
			data = new int[length];
			for(int i = 0; i < length; i++)
			{
				data[i] = 0;
			}
		}
		else
		{
			throw new NegativeArraySizeException("\"length\" must be greater than 0");
		}
	}
	public BinaryNumber(String str)
	{
		if(str.length() > 0)
		{
			this.length = str.length();
			data = new int[str.length()];
			for(int j = 0; j < str.length(); j++)
			{
				char c = str.charAt(j);
				int x = Character.getNumericValue(c);
				data[j] = x;
			}
		}
		else
		{
			throw new IllegalArgumentException("str.length() must be greater than 0");
		}
	}
	public int getLength()
	{
		return length;
	}
	public int getDigit(int index)
	{
		if((index < data.length) && (index >= 0))
		{
			return data[index];
		}
		else
		{
			throw new IndexOutOfBoundsException();
		}
	}
	public int[] getInnerArray()
	{
		return data;
	}
	public static int[] bwor(BinaryNumber bn1, BinaryNumber bn2)
	{
		int len = Math.max(bn1.getLength(), bn2.getLength());
		BinaryNumber res;
		int d1 = bn1.toDecimal();
		int d2 = bn2.toDecimal();
		int bwor = d1|d2;
		if(bwor == 0)
		{
			res = new BinaryNumber(len);
		}
		else
		{
			int zeros = len-Integer.toBinaryString(bwor).length();
			String conCat = "";
			for(int i=0; i<zeros; i++)
			{
				conCat += "0";
			}
			conCat += Integer.toBinaryString(bwor);
			res = new BinaryNumber(conCat);
		}
		return res.getInnerArray();
	}
	public static int[] bwand(BinaryNumber bn1, BinaryNumber bn2)
	{
		int len = Math.max(bn1.getLength(), bn2.getLength());
		BinaryNumber res;
		int d1 = bn1.toDecimal();
		int d2 = bn2.toDecimal();
		int bwand = d1&d2;
		if(bwand == 0)
		{
			res = new BinaryNumber(len);
		}
		else
		{
			int zeros = len-Integer.toBinaryString(bwand).length();
			String conCat = "";
			for(int i=0; i<zeros; i++)
			{
				conCat += "0";
			}
			conCat += Integer.toBinaryString(bwand);
			res = new BinaryNumber(conCat);
		}
		return res.getInnerArray();
	}
	public void bitShit(int direction, int amount)
	{
		int temp;
		if(amount < 1)
		{
			throw new IllegalArgumentException("\"amount\" must be greater than 0");
		}
		if(direction != 1 && direction != -1)
		{
			throw new IllegalArgumentException("\"direction\" must be 1 or -1");
		}
		temp = toDecimal();
		if(direction == 1)
		{
			temp = temp >> amount;
		}
		else
		{
			temp = temp << amount;
		}
		if(temp == 0)
		{
			data = new int[0];
		}
		else
		{
			String res = Integer.toBinaryString(temp);
			data = new int[res.length()];
			for(int i=0; i<data.length; i++)
			{
				data[i] = Character.getNumericValue(res.charAt(i));
			}
		}
	}
	public void add(BinaryNumber aBinaryNumber)
	{
		int d1 = toDecimal();
		int d2 = aBinaryNumber.toDecimal();
		String res = Integer.toBinaryString(d1+d2);
		data = new int[res.length()];
		for(int i=0; i<data.length; i++)
		{
			data[i] = Character.getNumericValue(res.charAt(i));
		}
	}
	public String toString()
	{
		return Integer.toBinaryString(toDecimal());
	}
	public int toDecimal()
	{
		int dec = 0;
		int exp = 0;
		for(int m = data.length-1; m >= 0; m--)
		{
			if(data[m] == 1)
			{
				dec += Math.pow(2, exp);
			}
			exp++;
		}
		return dec;
	}
}
