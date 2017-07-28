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
		d x.WriteLine(" for i=1:1:$l(string) set char=$e(string,i) if ($ascii(char)<32)||(char="""""""")||(char=""\"") goto escape")
		d x.WriteLine(" quit string")
		d x.WriteLine("escape")
		d x.WriteLine(" set out=""""")
		d x.WriteLine(" for i=1:1:$l(string) {")
		d x.WriteLine(" 	set char=$e(string,i)")
		d x.WriteLine(" 	if char=""\"" set char=""\\""")
		d x.WriteLine(" 	if char="""""""" set char=""\""""""")
		d x.WriteLine(" 	if $ascii(char)<32 set char=$case($ascii(char),""0"":""\u0000"",""1"":""\u0001"",""2"":""\u0002"",""3"":""\u0003"",""4"":""\u0004"",""5"":""\u0005"",""6"":""\u0006"",""7"":""\u0007"",""8"":""\b"",""9"":""\t"",""10"":""\n"",""11"":""\u000B"",""12"":""\f"",""13"":""\r"",""14"":""\u000E"",""15"":""\u000F"",""16"":""\u0010"",""17"":""\u0011"",""18"":""\u0012"",""19"":""\u0013"",""20"":""\u0014"",""21"":""\u0015"",""22"":""\u0016"",""23"":""\u0017"",""24"":""\u0018"",""25"":""\u0019"",""26"":""\u001A"",""27"":""\u001B"",""28"":""\u001C"",""29"":""\u001D"",""30"":""\u001E"",""31"":""\u001F"")")
		d x.WriteLine(" 	set out=out_char")
		d x.WriteLine(" }")
		d x.WriteLine(" quit out")		
	}
}

}

