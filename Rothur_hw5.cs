using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
/*

1. What is the difference between the static, const, and readonly keywords when applied to a type member?
they are Public, Private, Protected, Internal, Privated Protected, Protected Internal,
Public is avaliable to anything, Private is only avaliable to class itself, Protected is avaliable to class itself and its child class,
Internal is avaliable to anything that is under the same project with it, Privated Protected is accessible within same project and child class only,
Protected Internal is accessiable by anything that is in the same project or child class.

What does a constructor do?
constructor is called when we create an object from a class, we can also set up attributes by modtifying constructor, require user to pass in 
parameters when create instance.

Why is the partial keyword useful?
It is useful when comes to code organizing and handy on team collaborating.

What is a tuple?
tuple is c sharp is a fixed size data set that can store any kinds of data and access by either name or index

What does the C# record keyword do?
Its is similar to tuple but it is a data object, and immutable.

What does overloading and overriding mean?
overloading is when there is multiple methods with the same name under the same class, the compiler will decide which one to call based on the parameters type passed in.
overriding is when a method can be rewritten if it is in a child class and the base class has the same method.

What is the difference between a field and a property?
a field is a variable that holds data/value, a property wraps a field and provides methods to update value.

How do you make a method parameter optional?
we can make a method parameter optional by giving it a default value

What is an interface and how is it different from an abstract class?
interface is like a blueprint of methods we need to implement, it tells us what it does, not how it does it,
abstract class provides a base class that shares common code, it can have attributes and methods, while interface can only have methods.

What accessibility level are members of an interface by default ?
public

True / False : Polymorphism allows derived classes to provide different implementations of the same method.
true

True/False: The override keyword is used to indicate that a method in a derived class is providing its own implementation.
true

True / False: The new keyword is used to indicate that a method in a derived class is providing its own implementation.
false

True / False: Abstract methods can be used in a normal (non-abstract) class.
false

True / False: Normal(non -abstract) methods can be used in an abstract class.
true

True / False: Derived classes can override methods that were virtual in the base class.
true

True / False: Derived classes can override methods that were abstract in the base class.
true

True / False: Derived classes must override the abstract methods from the base class.
true

True / False: In a derived class, you can override a method that was neither virtual nor abstract in the base class.
false

True / False: A class that implements an interface does not have to provide an implementation for all of the members of the interface.
false

True / False: A class that implements an interface is allowed to have other members in addition to the interface members.
true

True / False: A class can inherit from more than one base class.
false

True / False: A class can implement more than one interface.
true */

abstract class Person
{
    public int Id { get; set; }
    public DateTime DateOfBirth { get; set; }
    public List<String> Address {  get; set; }
    private int salary;
    public int Salary
    {
            get { return salary; }
        set
        {
            try
            {
                if (value < 0)
                    throw new ArgumentOutOfRangeException(nameof(value), "Salary must be positive");

                salary = value;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error setting salary: {ex.Message}");
            }
        }

    }
}
class Instructor : Person
{
    public int DepartmentId{  get; set; }
}
class Stusdent : Person
{
    public List<Course> SelectedCourses {get; set; }
}
class Course
{

}

