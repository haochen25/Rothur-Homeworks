
using System.Collections.Generic;
using System.ComponentModel;

MyStack<int> temp = new MyStack<int>();
temp.Push(0);
temp.Push(105);

Console.WriteLine(temp.Count());

/*
 * Describe the problem generics address.
it makes code reusable and more easy to maintain, and remove the need for explicit casting when retrieving values


How would you create a list of strings, using the generic List class?
List<string> names = new List<string>();, string is to tell the list that this list is only for string data type.

How many generic type parameters does the Dictionary class have?
two, key and value

True/False. When a generic class has multiple type parameters, they must all match.
false


What method is used to add items to a List object?
list.Add

Name two methods that cause items to be removed from a List.
Remove()
RemoveAt()

How do you indicate that a class has a generic type parameter?
you add a <T> after the class name

True/False. Generic classes can only have one generic type parameter.
false

True/False. Generic type constraints limit what can be used for the generic type.
true

True/False. Constraints let you use the methods of the thing you are constraining to.
true
*/


public class MyStack<T>
{
    private  Stack<T> stack  = new Stack<T>();
    public int Count() { return stack.Count; }

    public void Push(T obj) { 
        stack.Push(obj);
        Console.WriteLine("element added");
    }
    public T Pop()
    {
        return stack.Pop();
        
    }
}
public interface IGenericRepository<T> where T: class
{
    public void Add(T item);
    public void Remove(T item);
    public void Save();
    public IEnumerable<T> GetAll();
    public T GetById(int id);
}
public class GenericRepository<T> : IGenericRepository<T> where T : class
{
    private List<T> list;
    public GenericRepository()
    {
        list = new List<T>();
    }
    public void Add(T item) { list.Add(item); }
    public void Remove(T item) { list.Remove(item); }
    public void Save() {  }
    public IEnumerable<T> GetAll() { return list; }
    public T GetById(int id) {  return list[id]; }
}