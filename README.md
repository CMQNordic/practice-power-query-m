## ___Power Query and M Formula Language - The Cheat Sheet___
---
#### By&nbsp;___Martin&nbsp;Czerwinski___ &nbsp;March&nbsp;2020&nbsp;®&nbsp;[__CMQ__&nbsp;Nordic&nbsp;AB](www.cmq.se "www.cmq.se (Martin Czerwinski @ CMQ Nordic AB)")
---

#### __TABLE OF CONTENT__
 ► __Power Query M Language__
  - [__M Language__](#m-language "What is M and what is it used for?") 
    - [Variables](#Variables "Switch between shells that power the terminal")
    - [Shortcuts](#useful-vscode-shortcuts "Our most frequently used shortcuts")
    - [Extensions](#useful-VSCode-extensions "Useful VSCode Extensions")
    - [EMMET Snippets](#useful-emmet-snippets "Useful EMMET Snippets")
  - [__VSCode__](#vscode "What is VSCode and what is build in?") 

<br>

---
If you have never use Excel or do not have any skills in any programing langueage we recoomed to go though the basics here and here in order to...


<section>

<article>

## [__Power Query and M Language__]()
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

### This is bla bla bla

What is Power Query and M and what is it used for?

instantly fell in love with Power Query after seeing how it can easily transform data in ways Excel finds difficult, and how it can automate repetitive workflows.

[Power Query M](https://docs.microsoft.com/en-us/powerquery-m/) language is a ...  A core capability of Power Query is to filter and combine, that is, to mash-up data from one or more of a rich collection of supported data sources. Any such data mashup is expressed using the Power Query M Formula Language. It's a functional, case sensitive language similar to F#. Tools like Microsoft Excel’s Get & Transform Data and Microsoft Power BI provide point-and-click interfaces allowing you to build data transformation sequences.

Before starting to click and drag-and-drop in Power Query Editor we recommend to understand at least the basics of the syntax and language structure of PowerQuery M language.

</article>
<br>
<article>

### __[Basics in Power Query and M syntax]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Following are basic Power Query M expressions that we recommended to get familiar with in order to understand the rest of this tutorial.

 - __Query Editor:__ Editor for M queries and graphical tool viewing clickable list of steps. Available for example in Excel [Power Query Editor](https://support.office.com/en-us/article/getting-started-with-power-query-7104fbee-9e62-4cb9-a02e-5bfb1a6c536a) or in [Power BI](https://powerbi.microsoft.com/en-us/what-is-power-bi/).

- __let / in:__
  
 - __Steps:__ Code rows in a query separated by `,`. Each steps represents a variable assignment inside an `let` expression. The ability to change the current step (defined after `in`) makes it easy to debug and view the produced value of a step. 

- __[Table](https://ssbi-blog.de/blog/technical-topics-english/tables-in-power-query-how-when-and-why/):__ Language M and Power Queries are design to work with large data sets usually loaded and represented as tables i.e. Excel sheets with its columns and rows. Tables are often the final result of a query and are subsequently loaded into the data model in Excel or Power BI. Tables mostly contain columns and rows, but they can be empty which looks like this: `#table({},{})`. More about this important topic later on.

- __[List](https://ssbi-blog.de/blog/technical-topics-english/lists-in-power-query-how-when-and-why/):__ Can be described like „an ordered sequence of values“ or as a „row of a table“ and is defined with opening and closing curly brackets. An example of a very simple  list with is `MyList ={"Anna", 24, "New York"}`. When accessing values `MyList{0}` returns "Anna" and `MyList{1}` returns 24. For index of last `List.Count(MyList)-1`. M supports infinitely large lists. Many functions in M that return lists as return values. For these reasons it is necessary to know how to deal with them in order to use the M language safely. Empty list `{}` is the simplest of all lists. `=` and `<>` make it possible to compare lists, while `&` combines lists. More about this later on.

- __[Record](https://ssbi-blog.de/blog/technical-topics-english/records-in-power-query-how-when-and-why/):__  Can be described as „a set of fields“. A field is a name/value pair where the name is a text value that is unique within the field’s record. An example of a very simple  record is `[A=1, B=2]`. Records can be empty, which looks like this `[]`. It's rare for a record to be loaded into the data model in Excel or Power BI, but if done it behaves like a table.
  
- __each and \_\_ :__ `Each` is useful when combined with the lookup operator 

- __Functions__: Can be Assigned to a variable and/or renamed. Renamed like variable_X = Function(a,b), then you can call variable_X(a,b) instead of functionX(a,b). Can be Used as a parameter to another function.we need to distinguish between calling a function (using it in our code) and referring to it function vs function().he syntax to create a function is:
function_name = (variable) => let body of function in result. The body of the function is like any other query that returns a value.
- __[Iterations](https://www.data-insights.de/part-3-for-next-loop-using-list-accumulate-in-m-for-power-query/):__ 

<br>

### __[Learn from examples]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Expression `let` lets us define executable expressions whose results are assigned to variables (steps). Those expressions are can be used to produce a final value that can be returned by `in` expression defined the end of the query.

Example:<br>
__let / in__ and definition of 2 variables and returning its product in a simple query.  
```javascript
let			
	A = 10,
	B = 20
in
	A*B
```
same as
```javascript
let
	A = 10,
	B = 20,
	Result = A*B
in 	
	Result
```				  
Value `200` is returned in both cases.

<br>

Example:<br> 
Iteration/looping - 5 times, in each adding "index" value to a list
```javascript

	// In C# language it looks something like this
	static List<int> GetList()
	{
		// Defining initial variables
		int index = 0;
		List<int> list = new List<int>();
	
		// Function to call for each iteration that adds elem to list
		void  AddToList(int elem) { list.Add(elem); }

		// Iterate, loop 
		while (index < 5)
		{
			AddToList(i);
			index = index + 1;
		}

		Console.WriteLine(string.Join("\t", list));
		return list;
	}


	// Same thing in M language
	let
		// Defining initial variables
		index = {0,1,2,3,4},
		list = {},

		// Function to call for each iteration. Simply adds elem to a list ().
		AddToList = (prev_result, cur_index) => List.InsertRange(prev_result, List.Count(prev_result), {cur_index}),

		// Iterate, loop 
		result = List.Accumulate(index, list, AddToList )
	in 
		result
```
List `0 1 2 3 4` is returned in both cases.

I think the example above (M part) need some explanation for unused eyes. Before you get used to M's way of working, it might seem a bit confusing. The key in example above are the 3 parameters in Accumulate() function and the 2 parameters in the callback function - __List.Accumulate( list , seed , accumulator(state, current)__ _(names as "seed", "state", "current" are used in documentation)_). 

__list__ - Here our variable "index" which is {0,1,2,3,4}. The function we provided in 3rd parameter is called for each element in this list. As we have 5 elements in "index" list, then Accumulate() will iterate 5 times, and function `AddToList` will be called 5 times.

__seed__ - Start value for the first loop or iteration. And it is our empty `list` that we start with and want to fill with values in the iterations. In first iteration this is sent to callback  as "result" - 1st parameter. 

__accumulator__ - This parameter is a function that we must design, in other languages so called "callback function". It is called for each iteration. By definition it has two required input parameters. First parameter, in documentation called "state", is a value from the previous iteration. But.. you think, first time callback function is called, there is not previous value. Yes, and here the __seed__ value, our start value, comes to use. In our case we provided empty list as initial value. Second time callback function is called stback function can beate parameter have changed and in our case is a list with one element. Third run it's a list with 2 element, and so on. The second parameter in the callback function __current__ is the element of the list, in our case "index", and is 0 first iteration, 1 second iteration, 2 third and so on.

__Note!_ [List.Accumulate()](https://docs.microsoft.com/en-us/powerquery-m/list-accumulate "Documentation for the function") is also of type "any", meaning that can return any structured value like tables, lists or records as a final result. It is not limited to this simple types we used in the example. For example index list can have more complicated elements that will be passes on to callback function for iteration. The result from the callback function can be tables, not limited to lists as in our example. List.Accumulate can be used to all kind of looping and iterations by the technique described in the example!




<br>

Following examples demonstrates syntax of __[Lists](https://ssbi-blog.de/blog/technical-topics-english/lists-in-power-query-how-when-and-why/ "Good tutorial about Lists in PowerQuery M")__ in PowerQuery M.

```javascript
//
// Returnes a string consisting of combined elemnts in
// lists. List elements are transformed.
// In end counts words in the output.
//

let
	List1 = {"adam", "&", "ewa"},
  	List2 = {"are", 24, "years", "old"},   // Note number in List2
	
  	// Capitalize list elements - by invoking function Proper() for each item.
  	List1_uppercase = List.Transform(List1, Text.Proper),
  	
	// Combine list-of-lists, to one list.
  	#"List1 & List2 combined" = List.Combine({List1_uppercase, List2}),
  	
	// Convert elements to text - by invoking function From() for each list elem.
  	#"Elems to texts" =  List.Transform(#"List1 & List2 combined", Text.From),
  	
	// Combine list elements, to one string, words separated by space.
  	#"Lists as string" = Text.Combine(#"Elems to texts", " "),
	
	// Add string to the end of a string  
  	#"Final string" = Text.Insert(#"Lists as string", Text.Length(#"Lists as string"), "!"),
  	
	// Count words in string
	NbrOfWords = List.Count(Text.Split(#"Final string", " ")),
	  
	Output = #"Final string" & " (number of words = " & Number.ToText(NbrOfWords) & ")"
in
  	Output
```
 String `"Adam & Ewa are 24 years old!"` is returned.

<br>

Following examples demonstrates syntax of __[Tables](https://ssbi-blog.de/blog/technical-topics-english/tables-in-power-query-how-when-and-why/ "Good tutorial about Tables in PowerQuery M")__ in PowerQuery M.

```javascript
let
  Source_Table1 = #table({"Name","Age"},{{"adam",9},{"ewa",9}}),
  Source_Table2 = #table({"Gender"},{{"male"},{"female"}}),
  Result = Source_Table2
in
 Result
```






<article>

</article>


<article>

</article>

</section>