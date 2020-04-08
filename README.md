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

<article>

## [__M Language__]()
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

<section>

<article>

What is M and what is it used for?

[Power Query M](https://docs.microsoft.com/en-us/powerquery-m/) language is a ...  A core capability of Power Query is to filter and combine, that is, to mash-up data from one or more of a rich collection of supported data sources. Any such data mashup is expressed using the Power Query M Formula Language. It's a functional, case sensitive language similar to F#. Tools like Microsoft Excel’s Get & Transform Data and Microsoft Power BI provide point-and-click interfaces allowing you to build data transformation sequences.

</article>

### __[M syntax & `let` and `in`]()__
<p align=right><a align=right href="#table-of-content">↩ Back To Top</a></p>

Expression `let` lets us define expressions whose results are assigned to variables. These expressions are used to produce a final value returned by the let expression within `in` expression.

Example of definition of 2 variables and returning its product, both cases value 200.
```javascript
let
  A = 10,
  B = 20
in
  A * B

// equeals // 

let
  A = 10,
  B = 20,
  Result = A * B
in
  Result
```

<br>

Following examples demonstrates syntax of [Records](https://ssbi-blog.de/blog/technical-topics-english/records-in-power-query-how-when-and-why/ "Good tutorial about Records in PowerQuery M") and [Lists](https://ssbi-blog.de/blog/technical-topics-english/lists-in-power-query-how-when-and-why/ "Good tutorial about Lists in PowerQuery M") in PowerQuery M.

```javascript
let
  //Definition of lists with elements
  List1 = {"adam", "&", "ewa"},
  List2 = {"are", 24, "years", "old"},
  // Transform() invokes function Proper() for each list elem, making them uppercase
  List1_uppercase = List.Transform(List1, Text.Proper),
  // Combine list of lists to one single list
  #"Lists combined" = List.Combine({List1_uppercase, List2}),
  // Invoke function From() for each list elem, making all elems texts
  #"Elems to texts" =  List.Transform(#"Lists combined", Text.From),
  // Convert list to one long string with words separated by " "
  #"Lists as string" = Text.Combine(#"Elems to texts", " "),
  // Add a char to the end of a string  
  #"Final string" = Text.Insert(#"Lists as string", Text.Length(#"Lists as string"),"!"),
  Result = #"Final string"
in
  Result
```

String `Adam & Ewa are 24 years old!` is returned from PowerQuery above.

<br>

Following examples demonstrates syntax of [Tables](https://ssbi-blog.de/blog/technical-topics-english/tables-in-power-query-how-when-and-why/ "Good tutorial about Tables in PowerQuery M") in PowerQuery M.

```javascript
let
  Source_Table1 = #table({"Name","Age"},{{"adam",9},{"ewa",9}}),
  Source_Table2 = #table({"Gender"},{{"male"},{"female"}}),
  Result = Source_Table2
in
 Result
```

Note here the syntax:

 - __Query editor:__ Editor for M queries and graphical tool viewing clickable list of steps 
 - __Steps:__ Each steps represents a variable assignment from let expression. The ability to change the current step makes it easy to view the value produced by an intermediate step. 
 - __Emmet__: Shortenings text snippets that expanded into full pieces of code.



<article>

</article>


<article>

</article>

</section>