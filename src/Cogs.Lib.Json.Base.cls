/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Base Extends %RegisteredObject
{

ClassMethod EscapeJSON(string As %String, escapeSolidus As %Boolean = 1) As %String
{
	set string=$replace(string,$C(0),"")
	set string=$replace(string,"\","\\")
	if escapeSolidus=1 Set string=$replace(string,"/","\/")
	set string=$replace(string,"""","\""")
	set string=$replace(string,$C(8),"\b")
	set string=$replace(string,$C(9),"\t")
	set string=$replace(string,$C(10),"\r")
	set string=$replace(string,$C(12),"\f")
	set string=$replace(string,$C(13),"\n")
	quit string
}

}

