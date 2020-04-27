-----
List of Tables

Table1 : Id Name Age
Table2 : ID NAME AGE
Tacle3 : id Gender


1. funcTransformHeaders(T as table) as table


ATT KUNNA
For each row - if expresion after each is true - then row is kept
Table.SelectRows(Table, each [_] = X) filtered table

For each list item - transform elem 
List.Transform(List, each [_] + 1) list of modified elems


Table.Join(table1, table2) - Returnes table with rows from two tables joined together
Table.Combine() - Returns a table that is the result of merging a list of tables
Table.CombineColumns()
ExpandTableColumn()

---

Cell vs Field Vs Row vs Column
Write a bit what is what

---
Naming convention in Power Query M
Write a bit about it
https://bengribaudo.com/blog/2018/01/19/4321/power-query-m-primer-part4-variables-identifiers
The variable can be of any supported Power Query type. Each variable within a let expression must have a unique name, but Power Query is fairly flexible about what you call it. You can even include spaces in the name, but you have to enclose it in double-quotes and precede it with a hash tag, a somewhat cumbersome naming convention (and one I prefer to avoid). The variable names are also the same names used to identify steps in the Applied Steps section in Query Editor’s right pane, so use names that make sense.

You can include as many procedural steps in your let statement as necessary and practical. If you include multiple steps, you must use commas to separate them. Each step generally builds on the preceding one, using the variable from that step to define the logic in the new step.

Strictly speaking, you do not have to define your procedural steps in the same physical order as their logical order. For example, you can reference a variable in the first procedural step that you define in the last procedural step. However, this approach can make the code difficult to debug and cause unnecessary confusion. The accepted convention when writing a let statement is to keep the physical and logical orders in sync.

You should remove any prefix and any suffix you might use in table names. For example, it is common to see Dim and Fact used as prefixes of tables in a relational star schema. There is no point in showing these prefixes to the user. You should also avoid prefixes of views such as “v” or “vw”. You should show “Customers” instead of “DimCustomers” or “vwCustomers”.


You should avoid abbreviations, prefixes, and suffixes in column names. However, an exception is possible to well-known acronyms. For example, you should use “Sales Amount” instead of “SalesAmt” or “SalesAmount”. Use spaces in column names. Do not use spacies in table names.
---


Is there a short name for Power Query Formula Language (informally known as 'M') that isn't 'M'?
Power Query Formula Language is long

M is short

Is there a nice middle ground or are we sticking with 'M'?

---

SEO optimize for question:
When does Table.TransformRows return a table

TODO:
Write article about loadin files from folder and the secons parameter in the function. Nothin on internet describes the second parameter!
Folder.Files(path as text, optional options as nullable record) as table

Many function tak an optional input parameter of type optional "options as nullable record". what is "options as nullable record" and where can we view and read more about them)


```
`Null	null
Logical	true    false
Number	0    1    -1    1.5    2.3e-5
Time	#time(09,15,00)
Date	#date(2013,02,26)
DateTime	#datetime(2013,02,26, 09,15,00)
DateTimeZone	#datetimezone(2013,02,26, 09,15,00, 09,00)
Duration	#duration(0,1,30,0)
Text	"hello"
Binary	#binary("AQID")
List	{1, 2, 3}
Record	[ A = 1, B = 2 ]
Table	#table({"X","Y"},{{0,1},{1,0}})
Function	(x) => x + 1
Type	type { number }    type table [ A = any, B = text ]`

```



The Not-a-Number value (#nan), often abbreviated NaN. NaNs are produced by invalid floating-point operations, such as dividing zero by zero.



THINGS to add:
Character ? - seems to when used with each and columns seems to ignore error if column do not exist 

Table.SelectRows(TABLE, each [Attributes]?[Hidden]? <> true)

If [Attributes] do not exist this function seems to return true
 so called optional-field-selection as follows, which returns null, if the selected field doesn’t exist


Very useful about functions. Call back function can be defined as step: Example

let  
	Table = ...
    AddOne = (x as number) as number => x + 1,  
    //additional expression steps  
    Result =  Table.TransformTableRows(Table, each AddOne([Age]?+5))  
in  
    Result 


---
How to End a Query if Condition is Met
I am looking for a solution that says:
`if <condition> then <perform action> else <end query> `
Is this possible in M?

Yes, it is not very straight forward to understand nor clear, but the way M is build is that a given step is only executed if it is needed in last return statement. So based on the condition in last step "result" either “then” block or the “else” block will be executed. 

```
let
    A = 2,
    Abort = if (A<>5) then error "A is not 5!" else false,

    // Something really time consuming
    Files = Folder.Files("C:\"),
    LongRun = List.Transform(Files[Content],each Excel.Workbook(_)),

    Result = if Abort then Abort else LongRun
in
    Result
```
Query above executes very fast because Abort throws an error and LongRun is skipped. Change `A` to 5 and run it query again. You may wait forever to finish!

---


FUNCTION
There are build in native M functions that shall be used extinsvly. some are used often. 

Functions that use records as input: functions that include a record as a function parameter. Very fiew. 

Web.Contents(url as text, optional options as nullable record) as binary
Folder.Files(path as text, optional options as nullable record) as table

 
LOOPING:

Write about list .enerate
List.Generate

List.Numbers(1, 10)
1..10


Adding and multiplying cells:

Pros and cons 
Res = 3 *  null * 2
Res = T[A]{0} * T[B]{0} * T[C]{0}
List.Product({3, null, 2})

EXPALIN THIS BETTER like here
List.Transform vs List.Accumulate
Both Accumulate and Transform functions loops over a list!
Difference is the parameters provided to callback function and that list only returns a list while accumulate iterates over a list as well but can return any object i.e a table.

Transform provides Current -> value of current element of iterated list. -> Returns list
Accumulate provides Current & Result previous iteration. -> Returns any object (of same type as "seed" it started with) 

Transform call the callback for EACH value in list and finally returns a new list

```
{11,12} = List.Transform({1, 2}, (current)=> current + 10)
{11,12} = List.Transform({1, 2}, each _ + 10)
{11...110} = List.Transform(List.Numbers(1, 100), each _ + 10)

```
Accumulate seeds the callback with "first result", note that this "seed" can be any object not limited to list! Then for each iteration callback receives both current list value and result from previous run. Returns last result. Note! This function  

```
{11,12} = List.Accumulate({1,2}, {}, (l, i) => List.InsertRange(l, List.Count(l), {i+10}))
T= #table({"A","B"},{}),
Res = List.Accumulate({1,2},T, (t,i)=> Table.InsertRows(t,Table.RowCount(t),{[A=i,B=i+10]}))
R = #table({"A","B"},{1,11},{2,12})

ADDED RECENTLY:
Acumulate is very usefull when manually creating tables with elemants. when iterating over a list and for every iteration adding new column or row to a table can be added. Same apply to list. In other words - each tie we want to from screach build up a list or table string with empty anf fillin for each iteration then this function is relly usefull.



```	
Power Query - Iterate over unknown number of solumns
___

```javascript
tblTest:
+------+------+------  
| Col1 | Col2 |  Col3 ...
+------+------+------
| 1    | 2    |
| null | null | ...
| null | 3    |
+------+------+


let
    tblTest = Excel.CurrentWorkbook(){[Name="tblTest"]}[Content],    
    tblNew = Table.FromColumns(
	{List.RemoveNulls(tblTest[Col1]),
    List.RemoveNulls(tblTest[Col2])},
	Table.ColumnNames(tblTest))
in
    tblNew

let
	tblTest = Excel.CurrentWorkbook(){[Name="tblTest"]}[Content],   
	ListOfColumns = Table.ToColumns(tblTest),
	tblNew = Table.FromColumns(List.Transform(ListOfColumns, each List.RemoveNulls(_)))
in
	tblNew


tblNew:
+------+------+
| Col1 | Col2 |
+------+------+
| 1    |  2   |
| null |  3   |
+------+------+
```
