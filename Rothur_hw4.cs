// See https://aka.ms/new-console-template for more information
using System.Numerics;

Console.WriteLine("Hello, World!");
Question1 tt = new Question1();
tt.PrintInfo(8);
Question2 aa = new Question2();
aa.FizzBuzz(30);
/*
1. What type would you choose for the following “numbers”?
A person’s telephone number: str or int because its a whole number


A person’s height: float because height in centimeter can be demical


A person’s age: int because it is whole number


A person’s gender (Male, Female, Prefer Not To Answer) : str because there are three options


A person’s salary: float because demical


A book’s ISBN: str or int because it is whole number


A book’s price: float because it can be demical


A book’s shipping weight: float because it can be demical


A country’s population : int for most of the cases, long for very large population


The number of stars in the universe : long long because of huge number


The number of employees in each of the small or medium businesses in the United Kingdom (up to about 50,000 employees per business): int because whole number

2. What are the differences between value type and reference type variables?
 What is boxing and unboxing?
value type variable stores the actual in memory, a copy is made when it is assigned to another variable, each variable has its own copy, 
reference type variable stores the reference to the data, when it is assigned to another variable, it will point to the same address in memory, changing one's
value will reflect on all other variable pointing to that address.
boxing is wrapping a value type into object, unboxing is the opposite, extracting an object to a data type.

3.What is meant by the terms managed resource and unmanaged resource in .NET?
managed resource is resource handled by .Net run time, such as int, str, list, while unmanaged resource is resource garbage collection does not know
how to release, such as file handles, or database connection

What is the purpose of the Garbage Collector in .NET?
its purpose is to automatically allocate and free memory for managed objects


Controlling Flow and Converting Types – Questions
    1. What happens when you divide an int variable by 0?
        I wwould get a runtime error, System.DivideByZeroException

    2. What happens when you divide a double variable by 0?
        I would not get an valid answer, it would be -infinity, infinity, or NaN, but it would not cause an error

    3. What happens when you overflow an int variable (assign a value beyond its range)?
        it will be wrapped around, say we have a variable assigned to the max value of integer, plus one will set it to the lowest value of integer

    4. hat is the difference between x = y++; and x = ++y;?
        y++ is post increment, ++y is pre increment

    5. What is the difference between break, continue, and return when used inside a loop statement?
        break will stop the loop and exit, continue will stop at that line and contintue the next loop, return also exit the loop and return the value if assigned.


    6. What are the three parts of a for statement and which of them are required?
        three parts are initialization, condition, and iteration, initialization initializes the value, condition means this loop will run as long as this condition is met,
        iteration is the motification to initial value when each loop cycle is ended.

    7. What is the difference between the = and == operators?
        = is used to assigned a value, == is used tgo compare two values.


    8. Does the following statement compile? for ( ; true; ) ;
        yes, it is equivalent to while(true)

    9. What interface must an object implement to be enumerated by the foreach statement?
        IEnumerable */
class Question1
{
        public void PrintInfo<T>(T number) where T : INumber<T>
        {
            Type t = typeof(T);

            if (t == typeof(sbyte))
                Console.WriteLine($"sbyte: Min={sbyte.MinValue}, Max={sbyte.MaxValue}, Size={sizeof(sbyte)} bytes");
            else if (t == typeof(byte))
                Console.WriteLine($"byte: Min={byte.MinValue}, Max={byte.MaxValue}, Size={sizeof(byte)} bytes");
            else if (t == typeof(short))
                Console.WriteLine($"short: Min={short.MinValue}, Max={short.MaxValue}, Size={sizeof(short)} bytes");
            else if (t == typeof(ushort))
                Console.WriteLine($"ushort: Min={ushort.MinValue}, Max={ushort.MaxValue}, Size={sizeof(ushort)} bytes");
            else if (t == typeof(int))
                Console.WriteLine($"int: Min={int.MinValue}, Max={int.MaxValue}, Size={sizeof(int)} bytes");
            else if (t == typeof(uint))
                Console.WriteLine($"uint: Min={uint.MinValue}, Max={uint.MaxValue}, Size={sizeof(uint)} bytes");
            else if (t == typeof(long))
                Console.WriteLine($"long: Min={long.MinValue}, Max={long.MaxValue}, Size={sizeof(long)} bytes");
            else if (t == typeof(ulong))
                Console.WriteLine($"ulong: Min={ulong.MinValue}, Max={ulong.MaxValue}, Size={sizeof(ulong)} bytes");
            else if (t == typeof(float))
                Console.WriteLine($"float: Min={float.MinValue}, Max={float.MaxValue}, Size={sizeof(float)} bytes");
            else if (t == typeof(double))
                Console.WriteLine($"double: Min={double.MinValue}, Max={double.MaxValue}, Size={sizeof(double)} bytes");
            else if (t == typeof(decimal))
                Console.WriteLine($"decimal: Min={decimal.MinValue}, Max={decimal.MaxValue}, Size={sizeof(decimal)} bytes");
            else
                Console.WriteLine($"{t.Name} is not supported.");
    }
    }

class Question2
{
    public void FizzBuzz(int num)
    {
        for (int i = 1; i < num+1; i++) {
            if (i % 3 == 0 && i%5 == 0) { Console.WriteLine("FizzBuzz"); continue; }
            if (i%3 == 0) { Console.WriteLine("Fizz");continue;}
            if(i % 5 == 0) { Console.WriteLine("Buzz"); continue; }
            Console.WriteLine(i);
        }
    }
}

/*Coding question 3 will loop infinity due the initial data type is byte, max of byte is 255, it will never reach the condition 500 */


class Question4
{
    public List<int> TwoSum(List<int> nums, int target)
    {
        nums.Sort();
        int left = 0;
        int right = nums.Count - 1;
        while (true)
        {
            int temp = nums[left] + nums[right];
            if (temp > target) { right -= 1; continue; }
            if (temp < target) { left += 1; continue; }
            return new List<int> { left, right };
        }
    }
}
