package Homework;

public class Complexity 
{
	public static void method1(int n) //n^2
	{
		int counter = 0;
		for(int i=0; i<n; i++)
		{
			for(int j=0; j<n; j++)
			{
				System.out.println("Operations Performed: " + counter);
				counter++;
			}
		}
	}
	public static void method2(int n) //n^3
	{
		int counter = 0;
		for(int i=0; i<n; i++)
		{
			for(int j=0; j<n; j++)
			{
				for(int k=0; k<n; k++)
				{
					System.out.println("Operations Performed: " + counter);
					counter++;
				}
			}
		}
	}
	public static void method3(int n) //log(n)
	{
		int counter = 0;
		for(int i=1; i<n; i*=2)
		{
			System.out.println("Operations Performed: " + counter);
			counter++;
		}
	}
	public static void method4(int n) //n log(n)
	{
		int counter = 0;
		for(int i=0; i<n; i++)
		{
			for(int j=1; j<n; j*=2)
			{
				System.out.println("Operations Performed: " + counter);
				counter++;
			}
		}
	}
	public static void method5(int n) //log(log(n))
	{
		int counter = 0;
		for(int i=2; i<n; i*=i)
		{
			System.out.println("Operations Performed: " + counter);
			counter++;
		}
	}
	
	public static int trueN = -1;
	public static int count = 0;
	public static void method6(int n) //2^n
	{
		if(n > trueN)
		{
			trueN = n;
			count = 0;
		}
		if(n > 0)
		{
			method6(n-1);
			method6(n-1);
		}
		else
		{
			System.out.println("Operations Performed: " + count);
			count++;
		}
		if(n == trueN)
		{
			trueN = -1;
		}
	}
}
