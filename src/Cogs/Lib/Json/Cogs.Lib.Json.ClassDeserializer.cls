/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.ClassDeserializer Extends %RegisteredObject
{

ClassMethod parseJSON(ByRef json As %String, wrapper As %String = "") As %RegisteredObject
{
	quit ..parseObject(json,$find(json,"{",$s(wrapper'="":$f(json,wrapper),1:1)),$length(json))
}

ClassMethod parseObject(ByRef json As %String, ByRef p As %Integer = 1, ByRef l As %Integer = 0) As %RegisteredObject [ Internal ]
{
	set (c,pre,string,str,name,ctype,cname)="",ob=..%New()
	for p=p:1:l {
		set ct=$e(json,p) if ((ct=" ")||(ct'?1ANP)),'string continue
		set pre=c,c=ct
		if "\"=pre,c="u" set esc=##class(%xsd.hexBinary).XSDToLogical($e(json,p+3,p+4)),str=$e(str,1,$l(str)-1)_esc,p=p+4,(pre,c)="" continue
		if "\"=pre set str=$e(str,1,$l(str)-1)_$s("""/\"[c:c,c="b":$c(8),c="t":$c(9),c="r":$c(13),c="f":$c(12),1:$c(10)),(pre,c)="" continue
		if """"=c,"\"'=pre set string=$s(string:0,1:1) continue
		if string set str=str_c continue
		if ":"=c set name=$method(ob,"bakedJsonName",str),str="" continue
		if ("["=c),("]"=pre) set name="" continue
		if "{"=c {
			if ctype="" set ctype=$method(ob,"bakedCType",name)
			if "%Collection.ArrayOfDT"=ctype set cname=name continue
			if "%Collection.ListOfObj"=ctype set sc=$method($property(ob,cname),"Insert",$method(ob,"bakedDelegator",cname,.json,.p,.l)) continue
			if "%Collection.ArrayOfObj"=ctype,(cname'="") set sc=$method($property(ob,cname),"SetAt",$method(ob,"bakedDelegator",cname,.json,.p,.l),name) continue 
			if "%Collection.ArrayOfObj"=ctype,cname="" set cname=name continue
			set $property(ob,name)=$method(ob,"bakedDelegator",name,.json,.p,.l) continue
		}
		if ((c=",")!(c="}")!(c="]")) {
			if ((pre="}")||(pre="]")&&(c'="}")) continue
			if "%Collection.ListOfDT"=ctype {
				if '((pre="[")&&(c="]")) set sc=$method($property(ob,cname),"Insert",$method(ob,"normaliseValue",cname,str,pre=""""))
			} elseif "%Collection.ArrayOfDT"=ctype {
				if name'=cname set sc=$method($property(ob,cname),"SetAt",$method(ob,"normaliseValue",cname,str,pre=""""),name)
			} else {
				if str'="" if "{["'[pre set $property(ob,name)=$method(ob,"normaliseValue",name,str,pre="""")
			}
			if ("}"=c),(ctype="") g END
			if ("]"=c)!("}"=c) set (cname,ctype)=""
			set (name,str)="" continue
		}
		if "["=c set ctype=$method(ob,"bakedCType",name),cname=name,(name,str)="" continue
		if "}"=c quit
		set str=str_c
	}
END
	quit ob
}

Method bakedDelegator(pname As %String, ByRef json As %String, ByRef p As %Integer, ByRef l As %Integer) As %RegisteredObject [ CodeMode = objectgenerator, Internal ]
{
	for pc=1:1:%compiledclass.Properties.Count() {
		set pr=%compiledclass.Properties.GetAt(pc)
		if pr.Type?1A1.ANP do %code.WriteLine(" if """_pr.Name_"""=pname set p=p+1 quit ##class("_pr.Type_").parseObject(.json,.p,.l)")	
	}
	do %code.WriteLine(" quit """"")
	quit 1
}

Method bakedCType(pname As %String) As %String [ CodeMode = objectgenerator, Internal ]
{
	for pc=1:1:%compiledclass.Properties.Count() {
		set pr=%compiledclass.Properties.GetAt(pc)
		if (pr.Collection="array")!(pr.Collection="list") do %code.WriteLine(" if """_pr.Name_"""=pname quit """_pr.RuntimeType_"""")	
	}
	do %code.WriteLine(" quit """"")
	quit 1
}

Method bakedJsonName(pname As %String) As %String [ CodeMode = objectgenerator, Internal ]
{
	for pc=1:1:%compiledclass.Properties.Count() {
		set pr=%compiledclass.Properties.GetAt(pc)
		if pr.Parameters.GetAt("JSONNAME")'="" do %code.WriteLine(" if """_pr.Parameters.GetAt("JSONNAME")_"""=pname quit """_pr.Name_"""")
	}
	do %code.WriteLine(" quit pname")
	quit 1
}

Method normaliseValue(pname As %String, pval, quoted) As %String [ CodeMode = objectgenerator, Internal ]
{
	for pc=1:1:%compiledclass.Properties.Count() {
		set pr=%compiledclass.Properties.GetAt(pc)
		if "%Library.String"=pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(quoted:pval,pval=""null"":$c(0),1:pval)")
		if "%Library.Date"=pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(pval=""null"":"""",1:$zdh($e(pval,1,10),3,,,,,,,$c(0)))")
		if "%Library.Time"=pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(pval=""null"":"""",1:$zth(pval))")
		if "%Library.TimeStamp"=pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(pval=""null"":"""",1:$p($tr(pval,""TZ"","" ""),""+""))")
		if "%Library.Boolean"=pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(pval=""true"":1,pval=""false"":0,""01""[pval:pval,1:"""")")
		if "%Library.Float %Library.Integer %Library.Numeric %Library.Currency"[pr.Type do %code.WriteLine(" if """_pr.Name_"""=pname quit $s(pval=""null"":"""",1:pval)")
	}
	do %code.WriteLine(" quit pval")
	quit 1
}

}

