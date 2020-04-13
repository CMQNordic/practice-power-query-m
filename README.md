## ___M&nbsp;used&nbsp;in&nbsp;Power&nbsp;Query - The&nbsp;Cheat&nbsp;Sheet___
---
__By&nbsp;Martin&nbsp;Czerwinski__ [CMQ&nbsp;Nordic&nbsp;AB](www.cmq.se "www.cmq.se (Martin Czerwinski @ CMQ Nordic AB)")®&nbsp;March&nbsp;2020&nbsp;

---
What is the M Formula language? How does it work with Power Query? What is the syntax and structure of M language?<br>

This is a compact tutorial, or a cheat sheet to look up things in for M language and how to use it in Power Query! Bookmark this page, share it and feel free to [reach out to us](www.cmq.se "Contact us!") with questions or comments. You can also hire us for assignments!

_Prerequisites: Some excel & programing skills._

---

#### __TABLE OF CONTENT__
 ► __M in Power Query__
  - [__What is M?__](#what-is-M? "What is M and what is Power Query?")
  - [__M syntax and main functionality__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 
    - [Power Query editor](#power-query-editor) | [Data into a query](#data-into-query-e) | [let & in](#let-in) | [Steps](#steps-e) | [Tables](#tables-e) | [Lists](#lists-e) | [Table operators](#operators-e)



 ► __Power Query__
 - [__What is Power Query?__](#what-is-power-query? "What is Power Query?") 
 - [__Power Query Editor__](#power-query-editor "Power Query Editor") 
   - [Excel](#m-language "Power Query Editor in Excel") 
   - [Power BI](#m-language "Power Query Editor in Power BI") 
   - [Other tools](#m-language "Power Query Editor in other tools") 
- [__Clickable UI functions__](#power-query-editor "Clickable UI functions Query Editor") 
   - [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools") | [Other tools](#m-language "Power Query Editor in other tools")

---

<section>

## [__What is M?__]()
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

 "__M__" stands for "mashup" and is a script language created by Microsoft for usage in their [__Power Query__]([#what-is-power-query?](https://www.howtoexcel.org/power-query/power-query-tips-and-tricks/)) tools designed to build queries that "mashup" data. It is very similar to [_F-Sharp_](https://en.wikipedia.org/wiki/F_Sharp_(programming_language)) language. What is data "mashup"? This term is used to describe the action of combining and modifying collected data to create a personalized data set. The core capability of Power Query is to mashup data using M scripting language.

We instantly fell in love with Power Query after seeing how it can easily import and transform data in ways Excel finds difficult, and how it can automate repetitive workflows! You can do a lot in Power Query Editor by clicking and drag-and-dropping in the UI, without writing any single line of code, but at some point you might need to dig and modify the auto-generated M code or write your own functions. Therefore we recommend to understand at least the basics of the syntax of M. It also makes it possible to create more complicated actions than those limited to click-and-drag in Power Query Editor UI.

<br>
<article>

### __[M syntax and main functionality]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Let's dig into a few areas that are core of Power Query and M. Each area is followed by a descriptive example:

|<a id="power-query-editor">Power Query editor</a>|
|:---|
|Power Query Editor is a graphical M script editor and part of  [Excel](https://support.office.com/en-us/article/getting-started-with-power-query-7104fbee-9e62-4cb9-a02e-5bfb1a6c536a "Getting Started with Power Query in Excel") and [Power BI](https://powerbi.microsoft.com/en-us/blog/getting-started-with-power-query-part-i/ "Getting Started with Power Query in Power BI"). It's used for working with M through its graphical interface that present M code as clickable list of steps. It is designed to be used by persons without any coding experience. In Excel the Power Query Editor can be launched by clicking on existing query in list of queries, launched from `Data tab -> Queries & Connections` or by importing data to from  `Data tab -> Get data`.|

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="data-into-query-e">Data into a query</a>|
|:---|
| M query is a script written in M language. It is often auto-created (by Excel or Power BI) when you import data into your data model in power query. In Excel it is done from "Data" -> "Get & Transform data" part to the left of the menu. Most basic data import to Power Query is from a table in current Excel document `Get Data -> From Other Sources -> From Table/Range`. Then Power Query automatically launches and auto-creates an M query named same as the imported table - loading the data to a variable called `source` that becomes the first step. You can later-on by opening the Power Query Editor further work on this query and modify is to your needs. Data loaded to a M query can come from different sources such as [tables/ranges/constants](https://support.office.com/en-us/article/define-and-use-names-in-formulas-4d0f13ac-53b7-422e-afd2-abd7ff379c64) in current Excel document, from web addresses, from other excel or cvs files, from facebook, azure, databases etc.  |

__Example__: <a id="">Importing of data to M query</a>
```javascript
// Import list of all tables and variables in current Excel document, as a table.
Source = Excel.CurrentWorkbook()

// Import data from specific table/range/variable in current workbook, as a table.
Source = Excel.CurrentWorkbook(){[Name="TableOrVariableOrRangeName"]}[Content]

TODO more
```

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="let-in">let & in</a>|
|:---|
|The `let` expression encapsulates a set of expressions to be computed and then used in a subsequent expression that follows the `in` statement.  The “single variable" following `in` is most common way to return a final value from a query and helps graphical query editors when debugging by selecting single steps. The purpose of `let` expression is to allow defining variables several. A `let` - `in`  expression is a block that produces a value and can be used wherever values are expected. This means we can assign such a block to variables, nest them inside other let expressions, and use them to produce values for function call arguments. |

__Example:__ <a id="let-in-e">"let in" blocs</a>
```javascript
// Define 2 variables and return its product
let			
	A = 10,
	B = 20
in
	A * B
```

```javascript
let
	// Define & calculate, then return the last one (most common usage)
	A = 10,
	B = 20,
	Result = A * B
in 	
	Result
```		
```javascript
// Assign let - in block to a variable that is returned
let	
	Result = (let			
				A = 10,
				B = 20
			in
				A * B)
in
	Result
```	
Value `200` is returned in all cases above.

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="steps-e">Steps</a>|
|:---|
|Code rows in a query separated by `,` are in Power Query editor graphically presented as steps. Each steps represents a variable assignment inside an `let` expression. The ability to change the current step (defined after `in`) makes it easy to debug and view the produced value of a step. |

<br><br>

|<a id="concatenations-e">List, record, table operators</a>|
|:---|
|The meaning of an operator can vary depending on the type of operand values. Example of operators in M: =, <= , <> , &, >, >=, <, <=, or, not and [more](https://docs.microsoft.com/en-us/powerquery-m/operators)|

|Equal&nbsp;→&nbsp;=| | |
|---|---|---|
||||
|Tables| `tableA = tableA` |  `true` |
|Lists| `listA = listB` | `false` |

<br>

|Not equal&nbsp;→&nbsp;<>| | |
|---|---|---|
|Tables| `tableA <> tableB` |  `true` |
|Lists| `listA = listB` | `false` |

<br>

|Concatenation&nbsp;→&nbsp;&| | |
|---|---|---|
|Strings| `"A" & "BC"` | `"ABC"`|
|Lists| `{1} & {2,3}` | `{1,2,3}` |
|Records| `[a=1] & [b=2,c=3]` |  `[a=1,b=2,c=3]` |
|Tables|` #table({"A"},{{1}}) & #table({"B"},{{2}})` | ` #table({"A","B"},{{1},{2}})` |

<br>

```javascript
tableA = tableA  → `true`
listA <> listB  → `true`

Concatenate:
Two strings: "A" & "BC"  →  "ABC"
Two lists: {1} & {2,3}  →  {1,2,3}
Two records: [a=1] & [b=2,c=3]  →  [a=1,b=2,c=3]
Two tables: #table({"A"},{{1}}) & #table({"B"},{{2}})  →  #table({"A","B"},{{1},{2}})

```

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="functions-e">Functions</a>|
|:---|
|In Power Query function is a mapping from a set of input values to a single output value. Functions are defined by `(param) => "body returning value"`, function body follows the goes-to (=>). A function can later be assigned to a variable, i.e. X = FunctionA - then you can execute it by calling X(e) instead of functionA(e). Functions be used as a parameters to another functions. We need to distinguish between invoking a function and referring to it. When assigned to a parameter or passed as parameter to other function we do not write out () nor the parameters - just the function name. The type of input parameter(s) and the type of value that the function returns can be defined but is optional. `() => 1+2` is a valid simple _unnamed_ function returning value 3. |

__Example:__ <a id="functions-e">Functions</a><br>
_Function that is named: fCalculate_
```javascript
// Defining fCalculate - that takes in a number and returns a number
(B as number) as number => 
let
	A = 10,
	Result = A * B
in 	
	Result
```	
Another query referring to and invoking function fCalculate
```javascript
let
	B = 20,

	// Renaming existing function (referring to it,)
	newFunctionName = fCalculate,

	// Invoking (executing) the function
	Result1 = fCalculate(B),
	Result2 = newFunctionName(B),

	// Prof that same function can have 2 names
	Result = if (Result1 = Result2) then "SAME" else "DIFFER"

in
	Result
```	
 `SAME` is returned because 200=200

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="each-e">Access cells in Lists, Records & Tables</a>|
|:---|
|Here comes some syntax on how to access parts of lists, records of tables|

|Table|T= #table({"Col One","Col Two"}, {{1,2},{3,4}})|
|---|---|
|Column in T|__T[Col One]__ → a list {1, 2}|
|Row in T|__T{0}__ → a record [A=1, B=2]|
|Cell in T|__T[A]{0}__ → a single value 1|
|All headers names in T|__Table.ColumnNames(T)__ → a list of texts {"Col One", "Col Two"}|
|One Header name in T|__Table.ColumnNames(T){0}__ → a text "Col One"|

<br>

|Record|R = [A=1,B=2,C=3]|
|---|---|
|Value in R |__R[A]__  → a single value 1|
|All field names in R |__Record.FieldNames(R)__  → a list of texts {"A", "B", "C"}|
|One field name in R |__Record.FieldNames(R){0}__  → a text "A"|

<br>

|List|L = {1, 2, 3, 4}|
|---|---|
|Lists value |__L{0}__ → 1|


<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="each-e">Expand cells in Lists, Records & Tables</a>|
|:---|
|When loading new data sources or combining data sources we often need to expand a list, table or record, a "set". Those "sets" are usually auto-created and presented as a table where compressed "sets to expand" are in one of the columns. There are two ways of doing it. By drilling down or by function (auto-generated when doing manually from UI). Here is the syntax:|


|Table:&nbsp;T| ![expand_table_1.png](expand_table_1.png) |
|---|---|
|Drill down|T[Content]{&nbsp;__0__&nbsp;} →&nbsp;expands&nbsp;ALL&nbsp;column&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|
|Drill down|T[Content]{__&nbsp;List.PositionOfAny(Table.Column(T,"Name"),&nbsp;{"tblSource1"})__&nbsp;} →&nbsp;same&nbsp;as&nbsp;above,&nbsp;expands&nbsp;ALL&nbsp;column&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|
|Expand with function|__Table.ExpandTableColumn__(Table.SelectRows(Source, each([Name] = "tblSource1")), "Content", {__"ID","Name","Age"__} ) →&nbsp;expands&nbsp;KNOWN&nbsp;columns&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|


<br>

|Record|R = [A=1,B=2,C=3]|
|---|---|
|Value in R |__R[A]__  → a single value 1|
|All field names in R |__Record.FieldNames(R)__  → a list of texts {"A", "B", "C"}|
|One field name in R |__Record.FieldNames(R){0}__  → a text "A"|

<br>

|List|L = {1, 2, 3, 4}|
|---|---|
|Lists value |__L{0}__ → 1|


<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="each-e">each & __</a>|
|:---|
|__`_`__ is an _unnamed_ variable in a function. The use of `_`  (that is called a throw-away_ variable) is common across several programming languages, Python included. Whenever a name of the input variable to a function is not necessary to be known (declared), in order to have less to write `_` can be used. Sometimes in obvious cases where the variable name is absolutely necessary, writing out `_` can be skipped if used with `each`. <br><br> __`Each`__ is a _function definition_ with one input variable without name nor type. It is an abbreviation for `(_) =>`. It has not the same functionality and meaning as "each" in java or C#. In M "conditional functions" are functions returning type logical (true or false). Those functions very often passed as input parameters to other functions in order to be called repetitively over sets of data (list elements, table rows or record elements ). Then word "each" makes sense in this context when defining those "conditional functions".<br><br> For example:<br> `tSelectedRows = Table.SelectRows(Source, each [Age] < 25)`<br><br>[Table.SelectRows](https://docs.microsoft.com/en-us/powerquery-m/table-selectrows)(table, "conditional function") calls the "conditional function" for each and every row in the table Source. The "conditional function" receives a row as a record with each call and if it returns true then whole row is added result, otherwise row removed. The whole `each` `_` concept is best described by following examples:|
__Example:__ <a id="each-e">Explaining each</a> 
```javascript
let
	// Define list of numbers
	list = {1, 2, 3, 4},
	
	// Exactly same functions - doing something to a number
	function1 = (elem) => elem * 100,
	function2 = each _ * 100,

	// Function Transform() calls fnTransformElemX for every list elem
	result1 = List.Transform(list, function1),
	result2 = List.Transform(list, function2),

	// Prof that "each" is same as "(_) =>" 
	result = if (result1 = result2) then "SAME" else "DIFFER"
in
	result
```
```javascript
// Code above is spread over several steps only for explaining purposes.
// Normally it's a one-liner. That's the whole purpose of "each" and "_"

result = List.Transform({1, 2, 3, 4}, each _ * 100)

→  {100, 200, 300, 400}
```
<br>

```javascript
let
	// Define a simple table 
    table = #table( {"Age","Name"}, {{18,"Anna"},{68,"Ewa"}} ),

	// Exactly same functions - sorting out persons under 23
	function1 = (row as record) as logical => row[Age] < 23,
	function2 = each _[Age] < 23,
    function3 = each [Age] < 23,

	// Function SelectRows() calls functionX for every row
    Result1 = Table.SelectRows(table, function1),
    Result2 = Table.SelectRows(table, function2),
	Result3 = Table.SelectRows(table, function3),


	// Prof that "each _[Age]" is same as "each [Age]"
    Result = if (Result1 = Result2) and (Result1 = Result3) then "SAME" else "DIIFER"
in
    Result
```
```javascript
// And the above as a one-liner

result = Table.SelectRows(#table({"Age","Name"},{{18,"Anna"},{68,"Ewa"}}), each [Age] < 23)

→  #table({"Age", "Name"}, {{18,"Anna"}} )
```

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

|<a id="lists-e">Lists</a>|
|:---|
|A [lists](https://ssbi-blog.de/blog/technical-topics-english/lists-in-power-query-how-when-and-why/) be described like „an ordered sequence of values“ or as a „row of a table“ and is defined with opening and closing curly brackets. An example of a very simple list with is `MyList ={"Anna", 24, "New York"}`. When accessing values `MyList{0}` returns "Anna" and `MyList{1}` returns 24. For index of last `List.Count(MyList)-1`. M supports infinitely large lists. Many functions in M that return lists as return values. For these reasons it is necessary to know how to deal with them in order to use the M language safely. Empty list `{}` is the simplest of all lists. `=` and `<>` make it possible to compare lists, while `&` combines lists. More about this later on.  <br><br>|

|<a id="tables-e">Tables</a>|
|:---|
|A  [__table__](https://ssbi-blog.de/blog/technical-topics-english/tables-in-power-query-how-when-and-why/) is specific set of rows and columns. Rows are represented as records of values, columns are represented as list of values. Each column has a header where column name is specified as a text. Column name in the header must be unique within the table. Each column also defines the data type of its elements (number, text, date, list, table etc.) or `any` which means that such a column can contain values of any data type.<br><br>`myTable = #table({"Col A", "Col B"}, {{1,3},{2,4}})`<br>`columnValues = myTable[Col A]` → list → __{1, 2}__<br>`rowValues = myTable{1}` → record → __[A=2, B=4]__<br>`value = myTable[Col A]{1}` → __2__<br><br> Power Query often work with sets of data represented as tables tables that often returned by functions, steps or queries. They are usually auto-created when data is imported to Power Query.<br><br> Example of creation of same table:<br> `tblPersons = #table( {"A","B"} , {{1,"x"},{2,"y"}} )`<br>`tblPersons = Table.FromRows( {{1,"x"},{2,"y"}} , {"A","B"} )`<br><br> Tables can also be created functions as [Table.FromList()](https://docs.microsoft.com/en-us/powerquery-m/Table-FromList) or [Table.FromRecords()](https://docs.microsoft.com/en-us/powerquery-m/Table-FromRecords).<br><br>Column names can be received like this:<br>`Names = Table.ColumnNames(tblPersons)` → list → `{"A", "B"}` <br><br>  There are mainly 3 operators that can be used in conjunction with tables: `=`, `<>` and `&`. Best way to get how it work is learn from following examples:<br><br>There are 2 functions used frequently and we want to go through them more detail as a learning example how to use table functions.<br><br> [Table.TransformColumnTypes(tbl, list)](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumntypes):<br> This function changes the type of one or several columns of the table that provided as first parameter. The result is returned as a NEW modified table. The second parameter is a list of elements with syntax `{"ColName", type X}` - describing what column(s) and what type to change to. Unfortunately most often this column names are __hard-coded__, making the function very sensitive to any future changes in column names. A simple change like "Name"  → "name" in the input data will make this function and whole query fail. There are cases when we can avoid hard-coding column names and this is presented in one of the examples below. <br><br> [Table.TransformColumns(tbl, list, )](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumns).<br><br> Many table are constructed in similar way so we explain this in more detail. It takes a table we want to transform as first parameter and returned new transformed table. Second parameter is<br> |


__Example:__ <a id="operators-e">Table operators `=`, `<>` and `&`</a> 
```javascript
| A | B |     
| 1 | 2 |

// Equal =
// Note! Column order do not matter!
tbl = #table({"A","B"},{{1,2}}) = #table({"A","B"},{{1,2}})  → true
tbl = #table({"A","B"},{{1,2}}) = #table({"B","A"},{{2,1}})  → true
tbl = #table({"A","B"},{{1,2}}) = #table({"B","A"},{{1,2}})  → false
tbl = #table({"A","B"},{{1,2}}) = #table({"a","B"},{{1,2}})  → false

// Do not equal <>
tbl = #table({"A","B"},{{1,2}}) <> #table({"A","B"},{{1,2}})  → false

// Combine & (same as Table.Combine())
tbl = #table({"A"},{{1}}) & #table({"B"},{{2}})  → #table({"A","B"},{{1,2})
tbl = #table({"A","B"},{{1,2}}) & #table({"A", "b"},{{3,4}})  → #table({"A","B","b"},{{1,2, null},{3,null,4}})

In the last example column names "B" and "b" mismatch therefore extra column added!
```

  __Example:__ <a id="accessing-e">Accessing row or single element in a table</a> 
```javascript
// Accessing a row in a table
// TableName[ColumnName] → the result is a list of elements
#table({"A","B"},{{1,"x"},{2,"y"}})[A] → a list {1, 2}
#table({"A","B"},{{1,"x"},{2,"y"}})[B] → a list {"x", "y"}

// Accessing a single cell in a table
// TableName[ColumnName]{RowIndex} → the result is whatever in element
| A | B |
| 1 | 3 |
| 2 | 4 | 
#table({"A","B"},{{1,3},{2,4}}){1}[B] → value 4
```
Example: <a id="dynamically-change-type-e" href="https://community.powerbi.com/t5/Desktop/Power-Query-M-Change-proper-case-for-first-row-of-the-table/td-p/318711">Dynamically change all table column to one typ</a><br>
_When changing type on a column through Power Query UI the auto-generated M code used hard-coded column names. If the column header naming  in the future data imports changes, our query stops working. There exist a more dynamic way of accessing columns._
```javascript
TODO
```

  __Example:__ <a id="accessing-e" href="https://www.thebiccountant.com/2017/01/09/dynamic-bulk-type-transformation-in-power-query-power-bi-and-m/">Capitalizing header texts in a table</a> 

```javascript
// | name | aGe |  <- tblPersons
// | Anna | 22  |
// | Carl | 56  | 

let
	tblPersons = #table({"name", "aGe"}, {{"anna",22},{"carl",56}}),
	result = tblPersons
	TODO
in
	return
```

|<a id="records-e">Records</a>|
|:---|
|A [__records__](https://ssbi-blog.de/blog/technical-topics-english/records-in-power-query-how-when-and-why/) is a set of name/value pairs, where name is a text value unique within the record. Each row in a table is a record.<br><br> `record = [A=1, B=2, C=1]`<br> `value = record[B]` → __2__ <br><br> Records can be empty, which looks like this `[]`. It's rare for a record to be loaded into the data model in Excel or Power BI, but if done it behaves like a table.  <br><br>|

|<a id="looping-and-iterations">Expanding tables or records</a>|
|:---|
|There are two ways to expand.With function ot by Drilling dow|


|<a id="looping-and-iterations">Looping & Iterations</a>|
|:---|
|[List.Accumulate()](https://docs.microsoft.com/en-us/powerquery-m/list-accumulate "Documentation for the function") and its 2nd parameter "seed" is of type "any", meaning that this function is not limited to lists objects, but can handle and  return any structured value like: tables, lists or records. En our example we just add a simple number as list element in callback but this technique can be used to perform more complicated iterative tasks on table or records. Function List.Accumulate is very powerful as iterations on sets of lists is big part of Power Query.<br><br> __Example:__ Iterations in M |
_Just for comparison, in C#, it may looks like this_
```javascript
	static List<int> GetList()
	{
		// Initial variables
		int NbrOfIterations = 5;
		List<int> Result = new List<int>();

		// Function to call for each iteration, adds item to a list
		void AddToList(List<int> res, int i) { res.Add(i); }

		// Iterate using for loop
		for (int i = 1; i <= NbrOfIterations; i++)
		{
			AddToList(Result, i);
		}

		Console.WriteLine(string.Join("\t", Result));
		return Result;  
	}

	List `1 2 3 4 5` is returned
```
_Iterate in M over another list using List.Accumulate._
```javascript
	// Similar thing in M language, iterating over another list
	let
		// Initial variables
		Iterations = {1, 2, 3, 4, 5},

		// Function to call for each iteration, adds item to a list
		AddToList = (res, i) => List.Combine({res, {i}}),

		// Iterate using function Accumulate(list, seed, accumulator(state, current))
		Result = List.Accumulate(Iterations, {}, AddToList)
	in 
		Result

		List `1 2 3 4 5` is returned
```

 I think the example above might need some explanation. List.Accumulate is a function that loops through items of a list and calls a provided function for each iteration. Following description of parameters explain how it works. It is a very powerful function - worth understanding! 

 The key here are parameters, specially a bit "special behavior" of parameters in the callback function ("accumulator"):<br> __List.Accumulate( list , seed , accumulator(state, current) )__ 

__list__ - Here we provide a list "iterations" which is {1,2,3,4,5}. Accumulate() calls the callback function (set in 3rd parameter) for each element in this list. As we have in tot 5 elements in the list, then Accumulate() will iterate 5 times meaning function `AddToList` will be called 5 times.

__seed__ - Start value for the very first iteration, the initial "state". As we expect the rest to be a list then we provide empty `list` as input that we later iterations add values to. In first iteration this exact value (empty list) is sent to our callback as "res" (state) parameter. 

__accumulator__ - Our function that that defines what to do for each iteration. It is often called "callback function" as we send it as parameter into another function that later call it. Accumulate() calls it for each iteration. By [definition](https://docs.microsoft.com/en-us/powerquery-m/list-accumulate) it has two required input parameters. First parameter, in documentation, is called "state" and simply is a value return in previous iteration. But for very first iteration there is no previous value. Yes, and here is where the __seed__ value, our start value, comes to use. In our case we provided empty list as initial value so it is provided to callback in first iteration. Second time callback function is called the result from previous run was a list with 1 element, third run it's a list with 2 element, and so on. The second parameter in the callback function, __current__ is simply the current element of the list Accumulate() iterates over. First tie it is element 1, second element 2 an so on.

_Similar thing in M language, using recursiveness_
```javascript
	let 
		// Defining initial variables
		Iterations = 5,

		// Iterate using recursiveness
		Iterate = (i) => if (i > 0) then List.Combine({@Result(i-1), {i}}) else {},

		Result = Iterate(Iterations)
	in
		Result

		List `1 2 3 4 5` is returned
```
In example above we use recursive function. When a function in M calls itself from inside itself then @ parameter must be used when called!

_Finally combining the both M techniques above -auto-create a list to later iterate over with Accumulate() function._
```javascript
	
	// Iterate only by defining number of iterations (here 10000)
	let
		Iterations = (i) => if (i > 0) then List.Combine({@Iterations(i-1), {i}}) else {},

		// Function to call for each iteration, adds item to a list
		AddToList = (res, i) => List.Combine({res, {i}}),

		// Iterate using Accumulate(list, seed, accumulator(state, current)) function
		Result = List.Accumulate(Iterations(10000), {}, AddToList)

	in
		Result

		List `1 2 3 4 5 ... 10000` is returned

```

<br>

### __[Learn from examples]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Expression `let` lets us define executable expressions whose results are assigned to variables (steps). Those expressions are can be used to produce a final value that can be returned by `in` expression defined the end of the query.



<br>








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

Power Query allows you to easily discover and connect to data from public and corporate data sources. This includes new data search capabilities to facilitate discovery, as well as capabilities to easily transform and merge data from multiple data sources, so you can analyze the data in Excel.

The Power Query Formula Language (informally known as "M") is a powerful mashup query language optimized for building queries that mashup data. It is a functional, case sensitive language similar to F#. M will likely be the first language that new users actually use although it is unlikely that they are aware of the fact that they are using it. The reason is that when users are importing data into their data model, which is generally the first step in using Power BI Designer, the queries are most likely using M in the background. However, the Query Editor provides a powerful graphical interface that allows users to perform complex data mashups without ever having to look at the M code that the Query Editor is building behind the scenes.

Power Query is a technology created by Microsoft and its core capability are to importing, modifying data from one or more data sources. Power Query is part of Excel and Power BI tools. It is a great tool when it come to collecting, modifying and analyzing big amounts of data.

what data can we import/collect with Power Query?
Power query can connect to tables and ranges in same or other Excel sheets and load data from there. It can connect to databases with tables, azure, internet pages, facebook and more. Read more about importing data from external sources - [Excel](https://support.office.com/en-us/article/Import-data-from-external-data-sources-Power-Query-be4330b3-5356-486c-a168-b68e9e616f5a) or  [Power BI](https://docs.microsoft.com/en-us/power-bi/service-get-data).




