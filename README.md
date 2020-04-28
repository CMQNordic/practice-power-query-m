
## ___Power&nbsp;Query&nbsp;M&nbsp;language -&nbsp;Dev&nbsp;Reference&nbsp;Guide&nbsp;-___
---
By&nbsp;Martin&nbsp;Czerwinski [CMQ&nbsp;Nordic&nbsp;AB](www.cmq.se "www.cmq.se (Martin Czerwinski @ CMQ Nordic AB)")®&nbsp;March&nbsp;2020&nbsp;

---

__M__ is the powerful language behind __Power Query__ helping to import, change and restructure big amounts of data. It's hidden behind the graphical interface of __Power Query Editor__ that is designed for "non-programmers". We still recommend to spend some time to understand the M syntax and how M works. There are many powerful operations to perform with M that you are not able of doing through its graphical interface.

This is __compact tutorial__ and an __reference guide__ that explains basics of M, its syntax and though some advanced examples gives you deep understanding to solution of some problems that every Power Query developer (Excel or Bower BI) at some point get stuck with. 

Bookmark this page, share it and feel free to [__reach out to us__](www.cmq.se "Contact us!") with questions, comments or requests for assignments!

_Prerequisites: Some excel & programing skills._

---

#### __TABLE OF CONTENT__

  - [__Basics to know__](#basics-to-know) 
    - [Why M?](#why-m-in-m)
    - [Basic syntax](#basics-syntax-of-m) ◦ [Power Query editor](#power-query-editor-in-m)<br>  
	- [Get data into a query](#get-data-into-the-query-in-m) ◦ [Data sources](#data-sources-in-m)<br> 
	- [About functions](#functions-in-m) ◦ [Each &  __](#each-in-m) ◦ [Errors](#errors-in-m) 
	- [Lists](#lists-in-m) ◦ [Records](#records-in-m) ◦ [Tables](#tables-in-m) ◦ [Accessing values](#accessing-values-in-m)<br> 
    - [Types](#access-values-in-m) ◦ [Operators and Expressions](#operators-in-m) <br>
	- [Some useful native functions to know](#native-functions-in-m)<br> 
	- [Things to avoid](#lists-e)<br>
 
 - [__Learn from examples__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 
	- [Example: import data](#data-sources) - Example of importing data from various data sources
	- [Example: functions](#functions-e) - Example of definition of functions
  	- [Example: lists](#list-syntax-example-in-m) - Example of using list
    - [Example: read values](#accessing-values-in-m) - How to access values

 - [__Native functions__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 
	- [Example: import data](#data-sources) - Example of importing data from various data sources
	- [Example: functions](#functions-e) - Example of definition of functions


 - [__Deep dive into some topics__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 

 	- [Skip step executions with if/else](#skip-code-execution-in-m) - Changing values and reshaping a table
 	- [Reshaping tables](#reshape-a-table) - Changing values and reshaping a table
 	- [Looping & Iterations](#looping-and-iterations-in-m) - Iterate in M like with _for_-loop.
	- [Change column names dynamically](#change-column-names-dynamically-in-m) - Description
	- [Change column types dynamically](#change-column-types-dynamically-in-m?) - Description
    - [Find first non null elem in a list](#find-first-non-null-elem-in-list-in-m) - Description

---

<br>

### __[Basics to know]()__


Let's go though core and basic areas of Power Query M language, some commonly used expressions and dig into few solutions that we thing might be very beneficial for you to understand. We start with basics and move forward with more advanced stuff.

<p align=right><a id="why-m-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Why M?]()
---

M is the language behind the scene of Power Query that in turn is build in Excel and Bower BI. 
M is a script language created by Microsoft for usage in their [Power Query tootls]([#what-is-power-query?](https://www.howtoexcel.org/power-query/power-query-tips-and-tricks/)) designed to build queries that "mash-up" data. "M" stands here for "mash-up". M is very similar to [_F#_](https://en.wikipedia.org/wiki/F_Sharp_(programming_language)) used for financial and scientific applications in particular. M provides a powerful data import experience that encompasses many features. You might wonder what data "mashup" is? This is a term used to describe the action of combining and modifying collected data to create a personalized data sets. The core capability of Power Query is to mashup data using M scripting language.

With Power Query is is very easy to import and transform data in ways Excel finds difficult. There are importing functionality and connections to external sources that can automate lots of repetitive workflows! You can do a lot in Power Query in its Editor by selecting and clicking in the UI, without writing any single line of code, but at some point you might need to dig and modify the auto-generated M code or write your own M functions. Therefore we recommend to understand at least the basics of the syntax of M. 

<p align=right><a id="basics-syntax-of-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Basics syntax]()
---
Open the Advanced Editor that is part of both Excel and Power BI and you will see `let` `in` expressions. Between `let` and `in` we declare variables and write M code as steps. Final result is defined in the end after `in` expression and that is what is returned from the script. A let/in expression is a block that produces a value and can be used wherever values are expected. This means we can assign such a block to variables, nest them inside other let expressions, and use them to produce values for function call arguments.

 Each __step__ is a variable declaration that execute some code and must be ended by `,` character. A step can be on own its line but does not have to. Variable names can be without spaces or consist of several words with spaces in between but then must be within ` #""`. 

In Power Query editor you can usually click on buttons that auto-create steps (variable=some expression doing something,). The names created are usually short sentences describing what the step is doing. This is not very practical and normal when you write M code by yourself. Then, as in most programing languages, variable names are shorter one worded expressions that are easy to identify and relate to looking at the code. Therefor the auto-generated code is not very easy to read cause of many #"" due to white spaces and many words.

Main object that we mostly work with in Power Query are Tables, List and records. More details about those later.

```javascript
let
  varA = "Hello",
  #"var B" = "World",
  ConcatenatedText = varA & " " & #"var B",
  Result = Text.Combine({ConcatenatedText, "!"})
in
  Result  
  
  → Hello World!
```

```javascript
// Assign let - in block to a variable that is returned
let	
	Result = let			
				A = 10,
				B = 20
			 in
				A * B
in
	Result

→ 200
```	

<p align=right><a id="power-query-editor-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Power Query editor]()
---

Power Query Editor is a graphical M script editor and part of  [Excel](https://support.office.com/en-us/article/getting-started-with-power-query-7104fbee-9e62-4cb9-a02e-5bfb1a6c536a "Getting Started with Power Query in Excel") and [Power BI](https://powerbi.microsoft.com/en-us/blog/getting-started-with-power-query-part-i/ "Getting Started with Power Query in Power BI"). It's used for working with M through its graphical interface that present M code as clickable list of steps. It is designed to be used by persons without any coding experience. In Excel the Power Query Editor can be launched by clicking on existing query in list of queries, launched from `Data tab -> Queries & Connections` or by importing data to from  `Data tab -> Get data`.

From Power Query editor you can open Advanced Editor ` View -> Advanced Editor` where M code can be written or modified.


<p align=right><a id="get-data-into-the-query-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Get data into a query]()
---

At least some query M code is auto-created by Power Query when you import data into your into Power Query and  create a connection to the source of that data. In Excel it is done from `Data -> Get & Transform data` section. Most basic data import to Power Query is from a table or range in current Excel worksheet - `Get Data -> From Other Sources -> From Table/Range`. Then Power Query automatically launches and auto-creates an M query named same as the imported table. In the created query data is loaded to first variable (first step) usually automatically named to `source`. You can later by opening the Power Query Advanced Editor further work on and modify this query to your needs.<br><br> Data loaded to power Query can come from sources like [tables/ranges/constants](https://support.office.com/en-us/article/define-and-use-names-in-formulas-4d0f13ac-53b7-422e-afd2-abd7ff379c64) in current Excel document, from web addresses, from other excel or cvs files, from facebook, azure, databases etc.  

Read more about how to do it in this good tutorial [here](TODO).

<br><p align=right><a id="data-sources-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Data sources]()
---
__From current workbook__: tables and names ranges as _tables_
```javascript
// Import all objects in current Excel workbook to Power Query as a table. Tables, Sheets and Named Ranges defined in workbook will each one reside one row in this table.
TableWithObjects = Excel.CurrentWorkbook()



```

__From local folder__: all files as _tables_
```javascript
// Import all files from a specific folder and sub-folders.
TableWithFiles = Folder.Files("C:\Users\marti\Favorites")



```

__From Web page__: HTML as _tables_
```javascript
// Import HTML web page represented as tables
TableWithWabPage = Web.Page(Web.Contents("https://www.timeanddate.com/"))



```

<br><p align=right><a id="functions-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [About functions]()
---

In Power Query function is a mapping from a set of input values to a single output value. Functions are defined by `(param) => "body returning value"`, function body follows the goes-to (=>). A function can later be assigned to a variable, i.e. X = FunctionA - then you can execute it by calling X(e) instead of functionA(e). Functions be used as a parameters to another functions. We need to distinguish between invoking a function and referring to it. When assigned to a parameter or passed as parameter to other function we do not write out () nor the parameters - just the function name. The type of input parameter(s) and the type of value that the function returns can be defined but is optional. `() => 1+2` is a valid simple _unnamed_ function returning value 3.

__Example:__ <a id="functions-e">Functions</a><br>
Function that is named fnCalculate
```javascript
// Function fnCalculate
(B as number) as number => 
let
	A = 10,
	Result = A * B
in 	
	Result
```	
Another query referring to and invoke fnCalculate
```javascript
let
	B = 20,

	// Renaming existing function (referring to it,)
	newFunctionName = fnCalculate,

	// Invoke the same function
	Result1 = fnCalculate(B),
	Result2 = newFunctionName(B),

	// Prof that same function can have 2 names
	Result = if (Result1 = Result2) then "SAME" else "DIFFER"

in
	Result
```	
 `SAME` is returned because 200=200


<br><p align=right><a id="each-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [`Each` & `__`]()
---

Expression __`each`__ is a _function definition_ with one input variable without name nor type. It is simple _the abbreviation_ for __`(_) =>`__. It has not the same functionality nor meaning as "each" in java or C#. In M "conditional functions" are functions returning type logical (true or false). Those functions very often passed as input parameters to other functions in order to be called repetitively over sets of data (list elements, table rows or record elements ). Then word "each" makes sense in this context when defining those "conditional functions".

Expression __`__`__ is an _unnamed variable_ in a function. The use of `_`  (that is called a throw-away_ variable) is common across several programming languages, Python included. Whenever a name of the input variable to a function is not necessary to be known (declared), in order to have less to write `_` can be used. Sometimes in obvious cases where the variable name is absolutely necessary, writing out `_` can be skipped if used with `each`.  

For example:<br> `tSelectedRows = Table.SelectRows(Source, each [Age] < 25)`<br><br>[Table.SelectRows](https://docs.microsoft.com/en-us/powerquery-m/table-selectrows)(table, "conditional function") calls the "conditional function" for each and every row in the table Source. The "conditional function" receives a row as a record with each call and if it returns true then whole row is added result, otherwise row removed. The whole `each` `_` concept is best described by following examples:

__Example:__ <a id="each-e">Explaining each</a> 
```javascript
let
	list = {1, 2, 3, 4},
	
	// Identical functions
	function1 = (elem) => elem * 100,
	function2 = each _ * 100,

	// Function Transform() calls functionX for every list elem
	result1 = List.Transform(list, function1),
	result2 = List.Transform(list, function2),

	// Prof that each is (_) => 
	result = if (result1 = result2) then "SAME" else "DIFFER"
in
	result

Returns  →   SAME

// Similar as above but as a one-liner
let
	result = List.Transform({1, 2, 3, 4}, each _ * 100)
in
	result

Returns  →  {100, 200, 300, 400}
```
<br>

```javascript
let
    table = #table( {"Age","Name"}, {{18,"Anna"},{68,"Ewa"}} ),

	// Exactly same functions
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

Returns  →   SAME

// Similar as above but as a one-liner

result = Table.SelectRows(#table({"Age","Name"},{{18,"Anna"},{68,"Ewa"}}), each [Age] < 23)

Returns →  #table({"Age", "Name"}, {{18,"Anna"}} )  (Ewa, over 23 was row removed)
```

<br><p align=right><a id="errors-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Errors]()
---
__TODO__. Write about error and error handling

_<a id="record-example-in-m">:</a> Record example_
```

```

<br><p align=right><a id="lists-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Lists]()
---

A _list_ can be described as _an ordered sequence of values of any type_. It is easy to visualize, work with and iterate over a list. Each element of a list is assigned an index starting with 0, meaning first element in a list always has value 0. M supports infinitely large lists. 

 Records can be empty - defined like this `{}`. Operators `=` and `<>` make it possible to compare lists, while `&` combines lists. List are easy and fast to iterate (loop) over.

_<a id="list-example-in-m">Example:</a> list example_
```
Define   →  L = {"a", 24} 
Get value   →  L{0}  →  a
Get value   →  L{List.Count(L)-1}  → 24
# elements  →  List.Count(L)  →  2
```
It happens that a list is empty. This may cause error and abort execution of the query. Do not forget guard for it.

```
Define  →  L = {} 
Get value → L{List.Count(L)-1} → error: index can't be negative
Get value → try {}{List.Count(L)-1} otherwise null →  null
```
You can read more about records [here](https://ssbi-blog.de/blog/technical-topics-english/lists-in-power-query-how-when-and-why/).



<a id="list-syntax-example-in-m">Example:</a> Following examples demonstrates syntax 


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


<br><p align=right><a id="records-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Records]()
---

A _record_ can be described as a set of _name=value_ pairs where _name_ is a text reference unique within the record and _value_ is an element of any type. 

 Records can be empty - defined like this `[]`. Operators `=` and `<>` make it possible to compare records, while `&` combines records. It's rare for a record to be loaded into the data model in Excel or Power BI, but if done it behaves like a table with _names_ as table headers and _values_ in first row. Note, a row of a table is Power Query presented as a record. 

You can read more about records [here](https://ssbi-blog.de/blog/technical-topics-english/records-in-power-query-how-when-and-why/).

_<a id="record-example-in-m">Example:</a> Record example_
```
Define  →  Record = [A=1, B=2] 
Get value  →  Record[B]  →  2
Table.FromRecords({Record, Record}) →
+-------+
| A | B |
|---+---|
| 1 | 2 |
| 1 | 2 |
+---+---+
```

<br><p align=right><a id="tables-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Tables]()
---
A _table_ can be described as a set of _rows and columns_ building up _cells_ where the values are stored. The very top of each table contains __unique__ _column names_ (aka headers names) that must always exist. Column names are case sensitive, "Name" is not same as "name". If _header names_ are not defined or of some reason unknown (normal scenario when importing data from i.e. csv files) then M auto-creates default names like "Column1", "Column2" etc. In Power Query tables are important as Power Query mostly works with sets of data represented as tables. Tables are also often returned by functions, steps or queries and auto-created when data is imported to Power Query.

It's important to understand that in Power Query M rows of a table are represented as_ records of values_, while columns are represented as _list of values_. Hold this in mind is when using [native M functions](https://docs.microsoft.com/en-us/powerquery-m/power-query-m-function-reference) as often parameters and iterations of those functions over rows or column are _lists_ or _records_.

_<a id="record-example-in-m">Example:</a> Example showing how to refer to elements ina table "T"_
```
Define → T = #table({"A","B"},{{1,2},{2,4}}) 
Define → T = Table.FromRows({{1,2},{2,4}},{"A","B"})

 T[A] = {1,2}
  ↓
+-------+
| A | B | ← Header → {A, B}
|---+---|
| 1 | 2 | ← T[B]{0} = 2
| 1 | 2 | ← T{1} = [A=1,B=2]
+---+---+
```

The header of a column also defines the data type of elements in the column i.e. `number`, `text`, `logical` (go to [types section](#types-example-in-m)) or `any` - which means that such a column can contain elements with a mix of types.

There are mainly 3 operators that can be used in conjunction with tables: `=`, `<>` and `&`. first two are preytty straight forward. The third one `&` is worth some extra explanation.

_<a id="record-example-in-m">Example:</a> Using `=` and `<>` on tables_
```javascript
// Order of column do not matter!
tbl = #table({"A","B"},{{1,2}}) = #table({"A","B"},{{1,2}}) → true
tbl = #table({"A","B"},{{1,2}}) = #table({"B","A"},{{2,1}}) → true

tbl = #table({"A","B"},{{1,2}}) = #table({"A","B","C"},{{1,2,3}}) → false
tbl = #table({"A","B"},{{1,2}}) <> #table({"a","B"},{{1,2}}) → true
```

_<a id="record-example-in-m">Example:</a> Combining tables by using `&`_
```javascript
tblA		tblB
+-------+	+-------+
| A | B |	| A | B |
|---+---|	|---+---|
| 1 |   |	| 1 | 2 | 
+---+---+	+---+---+ 

// Combine
T = tblA & tblB 
T= = Table.Combine({tblA, tblB}) (same but with function)

T
+-------+
| A | B |
|---+---+
| 1 |   |
| 1 | 2 |
+---+---+
```

```javascript
tblA		tblB
+-------+	+-------+
| A | B |	| b | c |
|---+---|	|---+---|
| 1 |   |	| 1 | 2 | 
+---+---+	+---+---+ 

// Combine
T = tblA & tblB 
T= = Table.Combine({tblA, tblB}) (same but with function)

T
+-------+-------+
| A | B | b | c |
|---+---|---+---|
| 1 |   | 1 | 2 | 
+---+---+---+---+ 
```

As it can be seen in example above when both columns names are same 2 rows are produced. In second case when they differ in case - only one. This is because "B" and "b" are not same names in the eyes of Power Query. <br> Therefore:<br> When _combining_ tho tables with exact same amount of column with exactly same names, then the number of rows will be doubled in the result. Rows are _"added"_ on top of each other. While when combining tables with sae amount of columns but all different names will produce table with same amount total rows - but double amount of columns. They are _"added"_ next to each other. 
 
 <br>

 Some useful function to keep in mind:
 - [Table.FromRecords(list of records i.e. _{[A=1,B=2],[B=1,B=2]}_)](https://docs.microsoft.com/en-us/powerquery-m/Table-FromRecords)<br> Creates a new table from the list of records and __returns__ this new __table__. 
 - [Table.ColumnNames(table)](https://docs.microsoft.com/en-us/powerquery-m/table-columnnames)<br> Puts names of each column in a list and __returns__ this new __list__.
 - [Table.TransformRows(table, _callback-function(current row as record)_)](https://docs.microsoft.com/en-us/powerquery-m/table-transformrows)<br> This complex and very useful function can return a table or list depending on what calls, for each row in the table, the callback-function with current row (in form of record) as input. Whatever value, record or single value) the callback-function returns is used as source for a new row. When done with all iterations puts those new "transformed" rows in a new table and __returns__ this new __table__.
 - [Table.TransformColumns(tbl, list, )](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumns)<br>
 - [Table.TransformColumnTypes(table, list with <name>,<type> elements. I.e. {"colA,typeA , colB,typeB"})](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumntypes)<br> This function 
 creates new columns the type of one or several columns of the table that provided as first parameter. The result is returned as a NEW modified table. The second parameter is a list of elements with syntax `{"ColName", type X}` - describing what column(s) and what type to change to. Unfortunately most often this column names are __hard-coded__, making the function very sensitive to any future changes in column names. A simple change like "Name"  → "name" in the input data will make this function and whole query fail. There are cases when we can avoid hard-coding column names and this is presented in one of the examples below.
 


 [Table.TransformColumnTypes(tbl, list)](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumntypes):<br>  <br><br> [Table.TransformColumns(tbl, list, )](https://docs.microsoft.com/en-us/powerquery-m/table-transformcolumns).<br><br> Many table are constructed in similar way so we explain this in more detail. It takes a table we want to transform as first parameter and returned new transformed table. Second parameter is.

You can read more about records [here](https://ssbi-blog.de/blog/technical-topics-english/tables-in-power-query-how-when-and-why/).

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


<br><p align=right><a id="accessing-values-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>


#### [Accessing values]()
---

Here comes some syntax on how to access parts of lists, records of tables

__TABLES__
```java
T
+-------+
| A | B |
|---+---+
| 1 | 2 |
| 3 | 4 |
+---+---+

T[A] →  a list {1, 3}
T{1} → a record [A=3, B=4]
T[B]{2}→ T{[A=2]}[B] → Table.Column(T, "B"){2} →  a single value 4

//The way T{[A=2]} only possible if values in column A are unique. Otherwise TODO???


Table.ColumnNames(T) → a list of texts {"A", "B"}
Table.ColumnNames(T){1} → a single text "B"

T[X] → error
T[X]? → null
T[A]? →  a list {1, 3}
Table.ColumnNames(T){2} → error
Table.ColumnNames(T){2}? → null ???

Note, when `?` is used after field reference then null is returned in case of "not found". Otherwise error is thrown!

var = "A"
T[var] → error  // referring to column from [] do not support variables
Table.Column(T, var) →  a list {1, 3} // here its fine to use variable

Withing brackets [] variables are not allowed. Here native functions can be used.
```

__RECORDS__
```java
R = [A=1, B=2, C=3]

R[A] → Record.Field(R, "A") → a single value 1
Record.FieldNames(R)  → a list of texts {"A", "B", "C"}
Record.FieldNames(R){0}  → a text "A"

R[X] → error
R[X]? → null 
R[A]? → a single value 1
Record.Field(R, "X")  →  ??? error or null 

var="A"
R[var] → error // referring to column from [] do not support variables
Record.Field(R, var) → a single value 1 // here its fine to use variable
```

__LISTS__
```
L = {1, 2, 3, 4}

L{0} → 1
L{1} → error
L{1}? → null
```

<br><p align=right><a id="access-values-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Types]()
---

||||
---|---|---
number | Type | 1 or 1,2
text | Type | "a" or "ewa"
logical | Type | true or false
function | Type | List.Transform
binary | Type | a file
list | Type | {1,2}
record | Type | [A=1, B=2]
table | Type | #table() TODO
time | Type | time values
date | Type | date values
datetime | Type | datetime values
duration | Type | duration values

<br><p align=right><a id="operators-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Operators and Expressions]()
---

Note in bellow list that meaning of an operator can vary depending on the type of operands. Full list of operators can be found [here](https://docs.microsoft.com/en-us/powerquery-m/operators).

||||
---|---|---
& |	Concatenation | "A" & "BC" → "ABC"<br> {1} & {2,3} → {1,2,3}<br> [a=1] & [b=2] → [a=1, b=2]<br> #date(2020,3,20) & #time(12,30,20) → 20/03/2020 12:30:20
x or y | Cond. OR | _evaluates right operand only if necessary_
x and y | Cond. AND | _evaluates right operand only if necessary_
x <> y | Not equal | →  `true` or `false`
not x | Logical NOT | →  `true` or `false`
x >= y | Greater or equal | →  `true` or `false`
x <= y | Less or equal | →  `true` or `false`
x = y | Equal | →  `true` or `false`
#duration | Duration | #duration(days, hours, minutes, seconds)<br>
#date | Date | #date(year, month, day)<br> #date(2020,3,20) - #duration(10,0,0,0) → 20020/03/10
#time | Time | #time(hour, minute, second)<br> #time(24,0,0) + #duration(0,14,90,0)  → 15:30:00 
1+2 | Sum |  → 3
1+"a" | Error | → We cannot apply operator + to types Number and Text
"a"+"b" | Error | → We cannot apply operator + to types Number and Text
"a"+null | Error | → error

<br>

|__=__| | |
|---|---|---|
|Tables| `tableA = tableA` |  `true` |
|Lists| `listA = listB` | `false` |
|Null| `null = listB` | `???` |
|__<>__| | |
|Tables| `tableA <> tableB` |  `true` |
|Lists| `listA = listB` | `false` |
|Null| `null <> listB` | `???` |
|__&__| | |
|Null| `null & {2,3}` | `null` |
|Strings| `"A" & "BC"` | `"ABC"`|
|Lists| `{1} & {2,3}` | `{1,2,3}` |
|Records| `[a=1] & [b=2,c=3]` |  `[a=1,b=2,c=3]` |
|Tables|` #table({"A"},{{1}}) & #table({"B"},{{2}})` | ` #table({"A","B"},{{1},{2}})` |


<br><p align=right><a id="skip-code-execution-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

### [Skipping code execution with if/esle]()
---


step1 = do something fast

step2 = do something bit time consuming

step3 = do something more time consuming

result = if step1<>null then step1 else if step2<>null then step2 else  step3
Play around with setting step1/2/3 to null and measuring execution time.

This is a technique to avoid executing steps in vain

__TODO__


<p align=right><a id="reshape-a-table-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Reshape a table]()
---

Following short examples describe how you reshape a table to different order of columns, different amount of columns with different values, modify ranges of values or how in Power Query just to  modified one single value in a table. Function `Table.TransformRows(table, function)` is very useful. Why? check the code bellow.

_<a id="reshape-example-1-table.transformRows-in-m">Example 1</a>: "Reshaping" to table to exactly same shape_
```
Table T
+-----------------------------+
| ID | First name | Last name |
|-----------------------------+
| 1  |   adam     |  lee      |
+----+------------+-----------+
| 2  |   ewa      |  cox      |
+-----------------------------+
```

```javascript
let
    T = #table({"ID","First name","Last name"},{{1,"adam","lai"},{2,"ewa","lee"}}),
    Result = Table.FromRecords(Table.TransformRows(T,each _))
in
    Result
```
Here the transform function `each _` (second input parameter in in function [Table.TransformRows()](https://docs.microsoft.com/en-us/powerquery-m/table-transformrows)) receives, for every row, current row as a record. Due to _ the very same input records is returned from the function (see section [functions](TODO)). As a result this function __returns a list of records__ as seen bellow.

```
Table.TransformRows() result
+--------+
|  List  |
|--------+
| record |
+--------+
| record |
+--------+
```
This list of records is in turn the input parameter to outer function [Table.FromRecords()](https://docs.microsoft.com/en-us/powerquery-m/table-fromrecords) as this function takes exactly this as input - a list of records. The inner function returns a list of records -> the outer function consumes a list of records. Perfect. In this example exactly same table as the one we stared with is produced.

<br>

_<a id="reshape-example-2-table.transformRows-in-m">Example 2</a>: "Reshaping" the table by combining two columns, capitalizing texts and reordering columns._
```
Table T
+-----------------------------+
| ID | First name | Last name |
|-----------------------------+
| 1  |   adam     |  lee      |
+----+------------+-----------+
| 2  |   ewa      |  cox      |
+-----------------------------+
```
```javascript
let
    T = #table({"ID","First name","Last name"},{{1,"adam","lai"},{2,"ewa","lee"}}),
    fknTransform = each [Name=Text.Proper([First name]) & " " & [Last name], id=[ID]],
    Result = Table.FromRecords(Table.TransformRows(T, fknTransform))
in
    Result
```

```
+---------------+
|   Name   | id |
|---------------+
| Adam lee | 1  |
+----------+----+
| Ewa cox  | 2  |
+---------------+
```
Exactly same technique as in example 1 above with the modification of transform function, second input parameter in in function [Table.TransformRows()](https://docs.microsoft.com/en-us/powerquery-m/table-transformrows) moved to own row for better readability. This function takes in current row record with three items [Id=.., First name=.., Last name=..] and returns a record with two items [Name=.., id=..]. In one go we changed order of columns, combined columns, capitalized elements, changes header names, and this function very well could have been written as a readable one-liner. Powerful.

<br>

_<a id="reshape-example-2-table.transformRows-in-m">Example 3</a>: Change only one single value of a column in Power Query._
```
Table T
+-----------------------------+
| ID | First name | Last name |
|-----------------------------+
| 1  |   adam     |  lee      |  ← i.e- change lee to null
+----+------------+-----------+
| 2  |   ewa      |  lee      |
+-----------------------------+
```
Before starting!<br>
In order to identify one unique cell in a table at least one column with all unique values must exist. In database-world a filed (=column) with all unique values can be set to a [primary key](TODO). Before trying to change a values in a table cell we must know what column contains only unique values. In our example we call such a column a "primary key column".

We assume here that table T in this example has column ID as "primary-key-colum" and every  value in ID column is and will be _unique_ for every row.

_Useful info! When you use the "Remove Duplicates" button in Power Query Editor to remove all duplicate values from a column or columns, which behind the scenes uses the [Table.Distinct()](https://docs.microsoft.com/en-us/powerquery-m/table-distinct) M function, then Power Query behind the scene defines a primary key on a table._

The code used function Table.AddColumn() that work in similar way as Table.TransformRows() as it iterates over each row and provides current row to a callback table. It could be implemented with Table.TransformRows() but as in sfinal part of this example we will transform this to fully dynamic function, then Table.TransformRows() would put a limitation as we need need to know all the field names. TODO is it really tru, can it not be dome with transform?
```javascript
let
    T = #table({"ID","First name","Last name"},{{1,"adam","lai"},{2,"ewa","lee"}}),

    // Values to provide each time in order 
    // to change one value in table Table.
    // Dynamic values. Can be changed for each run!
    NewValue = "CHANGED", 
    Table = T, // Table to change
    PrimKeyColumnName = "ID", // Name of primary key column, with all-unique-values
    PrimKeyValueToChange = 2, // Row to change
    ColumnNameToChange = "Last name", // Column to change

    // Small trick for later. 
    // Rename the column that is defined by PrimKeyColumnName as primary key
    // to a name defined by us, static name, never changing.
    TableBeforeChange = Table.RenameColumns(Table, {PrimKeyColumnName, "PK"}),

    // Save originals for later use, all as lists.
    lOriginalColumns = Table.ColumnNames(TableBeforeChange),
    lOriginalValues = Table.Column(TableBeforeChange, ColumnNameToChange),
    lPrivateKeys = TableBeforeChange[PK],

    // AddColumn() calls each-function for every row,then for desired row we set the new value otherwise old
    // Because field references like [mColName] are never dynamic
    TableAfterChange = Table.AddColumn(
		TableBeforeChange, 
		"TempCol", 
		each if ([PK]=PrimKeyValueToChange) then NewValue else lOriginalValues{List.PositionOf(lPrivateKeys,[PK])}),
    
    // Remove org name, rename tem name to org, restore previous order
    T1 = Table.RemoveColumns(TableAfterChange, ColumnNameToChange),
    T2 = Table.RenameColumns(T1, {"TempCol", ColumnNameToChange}),
    T3 = Table.ReorderColumns(T2, lOriginalColumns),

    Result=T3 
in
    Result
```

Same as above moved out to a fully dynamic function. Save the following function with name `fnChangeValue`.
```javascript
(Table as table, NewValue as any, PrimKeyColumnName as text, PrimKeyValueToChange as any, ColumnNameToChange ) as table =>
let
    // Small trick for later. 
    // Rename the column that is defined by PrimKeyColumnName as primary key
    // to a name defined by us, static name, never changing.
    TableBeforeChange = Table.RenameColumns(Table, {PrimKeyColumnName, "PK"}),

    // Save originals for later use, all as lists.
    lOriginalColumns = Table.ColumnNames(TableBeforeChange),
    lOriginalValues = Table.Column(TableBeforeChange, ColumnNameToChange),
    lPrivateKeys = TableBeforeChange[PK],

    // AddColumn() calls each-function for every row,then for desired row we set the new value otherwise old
    // Because field references like [mColName] are never dynamic
    TableAfterChange = Table.AddColumn(
		TableBeforeChange, 
		"TempCol", 
		each if ([PK]=PrimKeyValueToChange) then NewValue else lOriginalValues{List.PositionOf(lPrivateKeys,[PK])}),
    
    // Remove org name, rename tem name to org, restore previous order
    T1 = Table.RemoveColumns(TableAfterChange, ColumnNameToChange),
    T2 = Table.RenameColumns(T1, {"TempCol", ColumnNameToChange}),
    Result = Table.ReorderColumns(T2, lOriginalColumns)
in  
    Result
```
Calling our function from any query
```javascript
let
    T = #table({"ID","First name","Last name"},{{1,"adam","lai"},{2,"ewa","lee"}}),

	// change the value
    Result = fnChangeValue(T, null, "ID", 1, "Last name")
in
    Result
```
Changing a value in a table, totally dynamically is not a straight forward query to write. Here is a solution that works. There can be some error handling added and a performance tweak. Full solution can be found in our blog TODO [here](TODO).


<p align=right><a id="looping-and-iterations-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>


#### [Looping & Iterations]()
---
Looping and iterations in M work a bit differently. Here we do not have while for for- statements. In M we always loop over a range, and a callback function is usually called for each iteration. This is the standard procedure for most natime List, Record and Table functions.

[List.Accumulate()](https://docs.microsoft.com/en-us/powerquery-m/list-accumulate "Documentation for the function") and its 2nd parameter "seed" is of type "any", meaning that this function is not limited to lists objects, but can handle and  return any structured value like: tables, lists or records. En our example we just add a simple number as list element in callback but this technique can be used to perform more complicated iterative tasks on table or records. Function List.Accumulate is very powerful as iterations on sets of lists is big part of Power Query.

 __Example:__ Iterations in M 
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

<p align=right><a id="change-column-names-dynamically-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Change column names dynamically]()
---
There is often problematic whn code is auto-generated by Power Query that hard-coded column names are used in the query. This might work for the data loaded in at the moment, but same second as little as a letter changes in a column nama in source data, or a new column is added, then our query need to regenerated and debugged.

The main problem are always column and referring to those from code!

Here we show how to change column names dynamically without need of knowing number of columns nor their old names.

__TODO__
```
T= Table.RenameColumns(PromotedTable, List.Transform(Table.ColumnNames(PromotedTable), each {_, Text.Proper(Text.Trim(_))}))
```

<p align=right><a id="change-column-types-dynamically-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Change column types dynamically]()
---
There is often problematic whn code is auto-generated by Power Query that hard-coded column names are used in the query. This might work for the data loaded in at the moment, but same second as little as a letter changes in a column nama in source data, or a new column is added, then our query need to regenerated and debugged.

The main problem are always column and referring to those from code!

Here we show how to change column types dynamically without need of knowing number of columns nor their names.
__TODO__
```
T= Table.RenameColumns(PromotedTable, List.Transform(Table.ColumnNames(PromotedTable), each {_, Text.Proper(Text.Trim(_))}))
```

<p align=right><a id="#find-first-non-null-elem-in-list-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Find first non null element in a list]()
---
Here is  a simple function that finds first element in a list that is not null.
This kind of function do not exist in native library and can be sometimes handy to have.

```T = {null, null, "A", "B", null},
FirstNonNull= List.Accumulate(T, null, (res,cur)=> if (cur<>null) and (res=null) then cur else res)
```