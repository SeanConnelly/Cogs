/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Base Extends %RegisteredObject
{

ClassMethod EscapeJSON(string As %String, escapeSolidus As %Boolean = 0) As %String [ CodeMode = objectgenerator ]
{
	set x=%code
	set hasJSON=0
	try {
		set hasJSON=($system.Version.GetMajor()>2015)||($system.Version.GetMajor()=2015&&$system.Version.GetMinor()=2)	
	} catch err {
	}
	if hasJSON {
		d x.WriteLine(" quit $zcvt(string,""O"",""JSON"")")
	} else {
		d x.WriteLine(" set string=$replace(string,$C(0),"""")")
		d x.WriteLine(" set string=$replace(string,""\"",""\\"")")
		d x.WriteLine(" if escapeSolidus=1 Set string=$replace(string,""/"",""\/"")")
		d x.WriteLine(" set string=$replace(string,"""""""",""\"""""")")
		d x.WriteLine(" set string=$replace(string,$C(8),""\b"")")
		d x.WriteLine(" set string=$replace(string,$C(9),""\t"")")
		d x.WriteLine(" set string=$replace(string,$C(10),""\n"")")
		d x.WriteLine(" set string=$replace(string,$C(12),""\f"")")
		d x.WriteLine(" set string=$replace(string,$C(13),""\r"")")
		d x.WriteLine(" quit string")		
	}
}

}

