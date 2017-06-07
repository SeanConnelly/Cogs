/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Types.Json Extends %Library.String
{

/// The maximum number of characters the string can contain.
Parameter MAXLEN As INTEGER = 1000000;

ClassMethod parseObject(ByRef json As %String, ByRef p As %Integer = 1, ByRef l As %Integer = 0) As %RegisteredObject
{
	set string="{"
	set qflag=0
	set count=1
	set previous=""
	while count>0
	{
		set char=$e(json,p)
		if char="""",previous'="\" set qflag='qflag
		if char="{",'qflag set count=count+1
		if char="}",'qflag set count=count-1
		set string=string_char
		set previous=char
		set p=p+1
	}
	quit string
}

}

