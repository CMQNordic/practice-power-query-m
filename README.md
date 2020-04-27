
## ___Power Query M language___
---
__By&nbsp;Martin&nbsp;Czerwinski__ [CMQ&nbsp;Nordic&nbsp;AB](www.cmq.se "www.cmq.se (Martin Czerwinski @ CMQ Nordic AB)")®&nbsp;March&nbsp;2020&nbsp;

---

__M__ is the powerful language behind the scene of __Power Query__. For many M looks like a scary language, hidden behind its auto-generating graphical interface. As Power Query M developers we highly recommend you to spend little time to understand the M syntax and how it works. There are many powerfully operations that you can do with M that you are not be able to do through the provided graphical interface. Additionally often the auto generated steps can easily be modified to suit your needs.

__This is compact tutorial__ and a __reference__ document that __explains the basics__ of M, its syntax that provides solutions and __deep understanding__ to some of the problems that every power query developer at some point get stuck with. 

Bookmark this page, share it and feel free to [reach out to us](www.cmq.se "Contact us!") with questions, comments or request for assignments!

_Prerequisites: Some excel & programing skills._

https://docs.microsoft.com/en-us/powerquery-m/comments

---

#### __TABLE OF CONTENT__

  - [__Core areas and M syntax__](#core-areas-and-M-syntax) 
    - [Why M?](#why-m-in-m) ◦ [Power Query Editor](#power-query-editor-in-m) ◦ [The Basics](#the-basics-in-m)<br> 
	- [Get data into query](#get-data-into-the-query-in-m) ◦ [Data sources](#data-sources-in-m)<br> 
	- [Syntax & Expressions](#syntax-and-expressions-in-m) ◦ [Access values](#access-values-in-m) ◦ [Operators](#operators-in-m)<br> 
	- [Functions](#functions-in-m) ◦ [`Each` &  `__`](#each-in-m)
	- [Lists](#lists-in-m) ◦ [Records](#records-in-m) ◦ [Tables](#tables-in-m)<br> 
	- [Errors](#steps-e) ◦ [What does `?`](#lists-e) ◦ [Things to avoid](#lists-e)<br> 
 
 - [__Learn from examples__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 
	- [Example 1](#what-is-M-and-why?) - Description
	- [Example 2](#what-is-M-and-why?) - Description
	- [Example 3](#what-is-M-and-why?) - Description

 - [__Deeper into some topics__](#m-syntax-and-main-functionality "[M syntax with some Power Query basics") 
 	- [Reshape a table](#reshape-a-table) - changing values and reshaping a table
	- [Example 2](#what-is-M-and-why?) - Description
	- [Example 3](#what-is-M-and-why?) - Description

---

<br>

### __[Core areas and M syntax]()__


Let's go though the main areas of Power Query M language, some commonly used expressions and dig into few areas that we thing will be very beneficial for you to understand. Each area is followed by a descriptive example. Staring with basics moving toward more advanced stuff.

<p align=right><a id="why-m-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Why M?]()
---

M is the powerful language behind the scene of Power Query. 
__M__ is a script language created by Microsoft for usage in their [Power Query]([#what-is-power-query?](https://www.howtoexcel.org/power-query/power-query-tips-and-tricks/)) tools designed to build queries that "mash-up" data. "M" stands for "mash-up". M is very similar to [_F#_](https://en.wikipedia.org/wiki/F_Sharp_(programming_language)) language originated as a .NET language. Provides a powerful data import experience that encompasses many features. What is data "mashup"? This term is used to describe the action of combining and modifying collected data to create a personalized data set. The core capability of Power Query is to mashup data using M scripting language.

We instantly fell in love with Power Query after seeing how it can easily import and transform data in ways Excel finds difficult, and how it can automate repetitive workflows! You can do a lot in Power Query Editor by clicking and drag-and-dropping in the UI, without writing any single line of code, but at some point you might need to dig and modify the auto-generated M code or write your own functions. Therefore we recommend to understand at least the basics of the syntax of M. It also makes it possible to create more complicated actions than those limited to click-and-drag in Power Query Editor UI.

<p align=right><a id="power-query-editor-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Power Query editor]()
---

Power Query Editor is a graphical M script editor and part of  [Excel](https://support.office.com/en-us/article/getting-started-with-power-query-7104fbee-9e62-4cb9-a02e-5bfb1a6c536a "Getting Started with Power Query in Excel") and [Power BI](https://powerbi.microsoft.com/en-us/blog/getting-started-with-power-query-part-i/ "Getting Started with Power Query in Power BI"). It's used for working with M through its graphical interface that present M code as clickable list of steps. It is designed to be used by persons without any coding experience. In Excel the Power Query Editor can be launched by clicking on existing query in list of queries, launched from `Data tab -> Queries & Connections` or by importing data to from  `Data tab -> Get data`.

<p align=right><a id="the-basics-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [The Basics]()
---

__TODO__
```




```

<p align=right><a id="get-data-into-the-query-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Get data into query]()
---

M query is a script written in M language. It is often auto-created (by Excel or Power BI) when you import data into your data model in power query. In Excel it is done from "Data" -> "Get & Transform data" part to the left of the menu. Most basic data import to Power Query is from a table in current Excel document `Get Data -> From Other Sources -> From Table/Range`. Then Power Query automatically launches and auto-creates an M query named same as the imported table - loading the data to a variable called `source` that becomes the first step. You can later-on by opening the Power Query Editor further work on this query and modify is to your needs. Data loaded to a M query can come from different sources such as [tables/ranges/constants](https://support.office.com/en-us/article/define-and-use-names-in-formulas-4d0f13ac-53b7-422e-afd2-abd7ff379c64) in current Excel document, from web addresses, from other excel or cvs files, from facebook, azure, databases etc.  

__Example__: <a id="">Importing of data to M query</a>
```javascript
// Import list of all tables and variables in current Excel document, as a table.
Source = Excel.CurrentWorkbook()

// Import data from specific table/range/variable in current workbook, as a table.
Source = Excel.CurrentWorkbook(){[Name="TableOrVariableOrRangeName"]}[Content]

TODO more
```
<br><p align=right><a id="data-sources-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Data sources]()
---

__TODO__
```




```

<br><p align=right><a id="syntax-and-expressions-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Syntax & Expressions]()
---

__TODO__
```




```

<br><p align=right><a id="access-values-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Access values]()
---

|Equal&nbsp;→&nbsp;=| | |
|---|---|---|
|Tables| `tableA = tableA` |  `true` |
|Lists| `listA = listB` | `false` |
|__Not equal&nbsp;→&nbsp;<>__| | |
|Tables| `tableA <> tableB` |  `true` |
|Lists| `listA = listB` | `false` |
|__Concatenation&nbsp;→&nbsp;&__| | |
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

<br><p align=right><a id="operators-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Operators]()
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

<br>

_<a id="types-example-in-m">Example:</a> Common types used in M. Full list [here](https://docs.microsoft.com/en-us/power-bi/desktop-data-types)_
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


<br><p align=right><a id="functions-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Functions]()
---

In Power Query function is a mapping from a set of input values to a single output value. Functions are defined by `(param) => "body returning value"`, function body follows the goes-to (=>). A function can later be assigned to a variable, i.e. X = FunctionA - then you can execute it by calling X(e) instead of functionA(e). Functions be used as a parameters to another functions. We need to distinguish between invoking a function and referring to it. When assigned to a parameter or passed as parameter to other function we do not write out () nor the parameters - just the function name. The type of input parameter(s) and the type of value that the function returns can be defined but is optional. `() => 1+2` is a valid simple _unnamed_ function returning value 3.

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

<br><p align=right><a id="each-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [`Each` & `__`]()
---

Expression __`each`__ is a _function definition_ with one input variable without name nor type. It is an abbreviation for `(_) =>`. It has not the same functionality and meaning as "each" in java or C#. In M "conditional functions" are functions returning type logical (true or false). Those functions very often passed as input parameters to other functions in order to be called repetitively over sets of data (list elements, table rows or record elements ). Then word "each" makes sense in this context when defining those "conditional functions".

Expression __`__`__ is an _unnamed variable_ in a function. The use of `_`  (that is called a throw-away_ variable) is common across several programming languages, Python included. Whenever a name of the input variable to a function is not necessary to be known (declared), in order to have less to write `_` can be used. Sometimes in obvious cases where the variable name is absolutely necessary, writing out `_` can be skipped if used with `each`.  

<For example:<br> `tSelectedRows = Table.SelectRows(Source, each [Age] < 25)`<br><br>[Table.SelectRows](https://docs.microsoft.com/en-us/powerquery-m/table-selectrows)(table, "conditional function") calls the "conditional function" for each and every row in the table Source. The "conditional function" receives a row as a record with each call and if it returns true then whole row is added result, otherwise row removed. The whole `each` `_` concept is best described by following examples:

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



#### <a id="let-in">let & in</a>
---

The `let` expression encapsulates a set of expressions to be computed and then used in a subsequent expression that follows the `in` statement.  The “single variable" following `in` is most common way to return a final value from a query and helps graphical query editors when debugging by selecting single steps. The purpose of `let` expression is to allow defining variables several. A `let` - `in`  expression is a block that produces a value and can be used wherever values are expected. This means we can assign such a block to variables, nest them inside other let expressions, and use them to produce values for function call arguments. 

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

#### <a id="steps-e">Steps</a>
---

Code rows in a query separated by `,` are in Power Query editor graphically presented as steps. Each steps represents a variable assignment inside an `let` expression. The ability to change the current step (defined after `in`) makes it easy to debug and view the produced value of a step.



<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>


#### <a id="each-e">Access cells in Lists, Records & Tables</a>
---

Here comes some syntax on how to access parts of lists, records of tables

|Table|T= #table({"Col One","Col Two"}, {{1,2},{3,4}})|
|---|---|
|Column in T|__T[Col One]__ → a list {1, 2}|
|Row in T|__T{0}__ → a record [A=1, B=2]|
|Cell in T|__T[A]{0}__ → a single value 1|
|All headers names in T|__Table.ColumnNames(T)__ → a list of texts {"Col One", "Col Two"}|
|One Header name in T|__Table.ColumnNames(T){0}__ → a text "Col One"|
|__Record__|__R = [A=1,B=2,C=3]__|
|Value in R |__R[A]__  → a single value 1|
|All field names in R |__Record.FieldNames(R)__  → a list of texts {"A", "B", "C"}|
|One field name in R |__Record.FieldNames(R){0}__  → a text "A"|
|__List__|__L = {1, 2, 3, 4}__|
|Lists value |__L{0}__ → 1|

<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

#### <a id="each-e">Expand cells in Lists, Records & Tables</a>
---

When loading new data sources or combining data sources we often need to expand a list, table or record, a "set". Those "sets" are usually auto-created and presented as a table where compressed "sets to expand" are in one of the columns. There are two ways of doing it. By drilling down or by function (auto-generated when doing manually from UI). Here is the syntax:


|Table:&nbsp;T|  |
|---|---|
|Drill down|__T{0}[Content]__ →&nbsp;expands&nbsp;ALL&nbsp;column&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|
|Drill down|__T{[Name="tblSource1"]}[Content]__ →&nbsp;expands&nbsp;ALL&nbsp;column&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|
|Expand with function|__Table.ExpandTableColumn(&nbsp;_Table.SelectRows(Source, each([Name] = "tblSource1")_&nbsp;), "Content", {"Id","Name","Age"})__ →&nbsp;expands&nbsp;KNOWN&nbsp;columns&nbsp;from&nbsp;tblSource1&nbsp;to&nbsp;new&nbsp;table|


Source{[Name="SOURCES"]}[Content]

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



#### <a id="looping-and-iterations">Expanding tables or records</a>
---

There are two ways to expand.With function ot by Drilling dow


<a id="looping-and-iterations">Looping & Iterations</a>

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


<br>

### __[Skipping code execution with if/esle]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>


step1 = do something fast

step2 = do something bit time consuming

step3 = do something more time consuming

result = if step1<>null then step1 else if step2<>null then step2 else  step3
Play around with setting step1/2/3 to null and measuring execution time.

This is a technique to avoid executing steps in vain

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
This list of records is in turn the input parameter to outer function [Table.FromRecords()](https://docs.microsoft.com/en-us/powerquery-m/table-fromrecords) as this function takes exactly this as input - a list of records. The inner function returns a list of records -> the outer function consumes a list of records. Perfect. In this example __exactly same table as the one we stared with is produced.__

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

We assume here that table T in this example has column ID as "primary-key-colum" and every  value in ID column is and will be __unique__ for every row.

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


<p align=right><a id="reshape-a-table-in-m" align=right href="#table-of-content">↩ Back To Top</a></p>

#### [Change Names in a table]()
---
```

T= Table.RenameColumns(PromotedTable, List.Transform(Table.ColumnNames(PromotedTable), each {_, Text.Proper(Text.Trim(_))}))
```


#### [Change Names in a table]()
---

```
T= Table.RenameColumns(PromotedTable, List.Transform(Table.ColumnNames(PromotedTable), each {_, Text.Proper(Text.Trim(_))}))
```

#### [Find first noon null element in a list]()
---

```
T = {null, null, "A", "B", null},
FirstNonNull= List.Accumulate(T, null, (res,cur)=> if (cur<>null) and (res=null) then cur else res)
```