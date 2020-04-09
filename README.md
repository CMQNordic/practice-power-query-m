## ___M Formula Language in Power Query - The Cheat Sheet___
---
#### By&nbsp;___Martin&nbsp;Czerwinski___ &nbsp;March&nbsp;2020&nbsp;®&nbsp;[__CMQ__&nbsp;Nordic&nbsp;AB](www.cmq.se "www.cmq.se (Martin Czerwinski @ CMQ Nordic AB)")

---
What is the M Formula language? What is the syntax and structure of M and how to work with with it in Power Query? This is an compact tutorial, or a cheat sheet to look up things in - that will give you answer to all that questions and more! Please bookmark this page and __share it__. Feel free to [reach out to](www.cmq.se "Contact us!") us with questions, comments or requests. You can also hire us for assignments.

Prerequisites: If you have never used Data tab in Excel, or do not have any at all skills in any programing languages - then this article could be hard for you to follow. We first get familiar with __THIS__ and __THIS__.

---

#### __TABLE OF CONTENT__
 ► __M in Power Query__
  - [__What is M and why in Power Query?__](#what-is-M-and-why-power-query? "What is M and what is it used in Power Query?")
  - [__M syntax & some Power Query basics__](#m-syntax-with-some-power-query-basics "[M syntax with some Power Query basics") 
    - [Power Query Editor](#power-query-editor "Switch between shells that power the terminal") | [Creating my first query](#creating-my-first-query "Our most frequently used shortcuts") | [Shortcuts](#useful-vscode-shortcuts "Our most frequently used shortcuts") | [Shortcuts](#useful-vscode-shortcuts "Our most frequently used shortcuts")



 ► __Power Query__
 - [__What is Power Query?__](#what-is-power-query? "What is Power Query?") 
 - [__Power Query Editor__](#power-query-editor "Power Query Editor") 
   - [Excel](#m-language "Power Query Editor in Excel") 
   - [Power BI](#m-language "Power Query Editor in Power BI") 
   - [Other tools](#m-language "Power Query Editor in other tools") 
- [__Clickable UI functions__](#power-query-editor "Clickable UI functions Query Editor") 
   - [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools")


<br>

---

<section>

## [__What is M and why Power Query?__]()
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

 "M" stands for "Mashup" and is a script language created by Microsoft for usage in their [Power Query tools](#what-is-power-query?). It is a query language designed to build queries that mashup data. It is similar to [F-Sharp](https://en.wikipedia.org/wiki/F_Sharp_(programming_language)) language. What is data "mashup"? This term is used to describe the action of combining and modifying collected data to create a personalized high-value product for distribution or personal consumption. The core capability of Power Query is to mashup data and its M scripting Language is used for this purpose.

We instantly fell in love with Power Query after seeing how it can easily import and transform data in ways Excel finds difficult, and how it can automate repetitive workflows!

You can do a lot in Power Query Editor by clicking and drag-and-dropping in the UI, without writing any single line of code, but sometimes you might need to dig and modify the automated M code or write new functionalities. Therefore we recommend to understand at least the basics of the syntax of this language. It also makes it possible to create more complicated actions than those limited to click-and-drag in Power Query Editor UI.

<br>
<article>

### __[M syntax with some Power Query basics]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Let's din into some few areas that are core of Power Query and M each followed by an descriptive example:



|<a id="power-query-editor">Power Query Editor</a>|
|:---|
|Power Query Editor is a graphical M script editor build-in in [Excel](https://support.office.com/en-us/article/getting-started-with-power-query-7104fbee-9e62-4cb9-a02e-5bfb1a6c536a "Getting Started with Power Query in Excel") and [Power BI](https://powerbi.microsoft.com/en-us/blog/getting-started-with-power-query-part-i/ "Getting Started with Power Query in Power BI"). It's used for working with sets of data, creating M queries and uploading the results to external sources (i.e. Excel sheets). Its graphical interface presents M code as clickable list of steps. It is designed and handy for persons without any coding experience. In Excel the Power Query Editor can be launched by clicking on a query or connections in Data tab -> Queries & Connections. It can also be started from  Build in the editor there is Advanced editor aimed to manuals writing and editing the M code.  |

	PIC of POWER QUERY EDITOR  &  PIC OF Advanced editor

|<a id="creating-my-first-query">Creating my first query</a>|
|:---|
| Text  |

 - __Creating my first query:__ TODO

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
	A * B
```
same as
```javascript
let
	A = 10,
	B = 20,
	Result = A * B
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

__Note!__ [__List.Accumulate()__](https://docs.microsoft.com/en-us/powerquery-m/list-accumulate "Documentation for the function") and its 2nd parameter "seed" is of type "any", meaning that this function is not limited to lists-objects but can return and forward to callback function any structured value like tables, lists or records.  For example "index" list can have other types of elements that will subsequently feed the callback function during iteration. The result from the callback function can be tables, not limited to initial empty list, as in our example. Function List.Accumulate is very powerful as looping an iterations are big part of programing logic.




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


## [__What is Power Query__]()
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>
'
Power Query is a technology created by Microsoft and its core capability are to importing, modifying data from one or more data sources. Power Query is part of Excel and Power BI tools. It is a great tool when it come to collecting, modifying and analyzing big amounts of data.

what data can we import/collect with Power Query?
Power query can connect to tables and ranges in same or other Excel sheets and load data from there. It can connect to databases with tables, azure, internet pages, facebook and more. Read more about importing data from external sources - [Excel](https://support.office.com/en-us/article/Import-data-from-external-data-sources-Power-Query-be4330b3-5356-486c-a168-b68e9e616f5a) or  [Power BI](https://docs.microsoft.com/en-us/power-bi/service-get-data).




