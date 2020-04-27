//(List as list, optional Culture as nullable text) =>
let  
    Table= GetData,          
    List = Table.Column(Table,"Lists"),
    Culture = null,
    
    fnGet=(ColumnName as text, List as list, Culture optional as nullable text) =>
    let
        ListOfTypes = List.Transform(List, each  Value.Type(_)),
        UnionTypes = Type.Union(Types),

		ItemTypes = List.Transform(List, each if Value.Type(Value.FromText(_, Culture)) = type number
									then if Text.Contains(Text.From(_, Culture),"%") then Percentage.Type
										else if Text.Length(Text.Remove(Text.From(_, Culture), {"0".."9"} & Text.ToList("., -+eE()/'")))>0 
											then Currency.Type
											else if Int64.From(_, Culture) = Value.FromText(_, Culture)
												then Int64.Type 
											else type number
									else Value.Type(Value.FromText(_, Culture))
					),
        
        ListItemType = Type.NonNullable(Type.Union(ItemTypes)),
        
        Result = [A=ColumnName, B=UnionTypes, C=ListItemType]
    in
        Result,

        ListOfColumnNames = Table.ColumnNames(Table),
        ListOfRecords = List.Transform(ListOfColumnNames, each fnGet(_, Table.Column(Table,_), null)   ),
        T = Table.FromRecords(ListOfRecords),
       

        Result = T
in
    Result