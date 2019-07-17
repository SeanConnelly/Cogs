/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.Runner Extends %RegisteredObject
{

ClassMethod RunAll()
{
	kill ^CacheTemp.CogsJsonTests($Job)
	&sql(declare cur1 cursor for
	     select parent, Name 
	     into :className, :methodName
	     From %Dictionary.CompiledMethod
		 where parent in (
    	 	select ID from %Dictionary.CompiledClass
    	 	where ID like 'Cogs%' and Super = 'Cogs.Lib.Json.Tests.Runner'
	 	 ) and
		 ReturnTypeParams like '%UNITTEST=1%'
	)
	&sql(open cur1)
	&sql(fetch cur1)
	while SQLCODE=0 {
		set sc=$classmethod(className,methodName)
		&sql(fetch cur1)
	}
	&sql(close cur1)
	write !!
	write !,$get(^CacheTemp.CogsJsonTests($Job,"PASS"),0)," PASSES"
	write !,$get(^CacheTemp.CogsJsonTests($Job,"FAILED"),0)," FAILURES"
	if $get(^CacheTemp.CogsJsonTests($Job,"FAILED"),0)>0 {
		write !!,"See ^CacheTemp.CogsJsonTests(",$Job,",""FAILED"") for a list of failures"	
	}
}

ClassMethod AssertEquals(pVal1, pVal2, pDesc = "") As %Status
{
	if pVal1 = pVal2 {
		set ^CacheTemp.CogsJsonTests($Job,"PASS")=$get(^CacheTemp.CogsJsonTests($Job,"PASS"))+1	
	} else {
		set ^CacheTemp.CogsJsonTests($Job,"FAILED")=$get(^CacheTemp.CogsJsonTests($Job,"FAILED"))+1
		set ^CacheTemp.CogsJsonTests($Job,"FAILURES",$I(^CacheTemp.CogsJsonTests($Job,"FAILURES")))="Failure in "_..%ClassName(1)_" ("_pDesc_") values do not match..."_$c(13,10,13,10)_pVal1_$c(13,10,13,10)_pVal2_$c(13,10,13,10)
	}
	quit $$$OK
}

ClassMethod AssertNotEquals(pVal1, pVal2, pDesc = "") As %Status
{
	if pVal1 '= pVal2 {
		set ^CacheTemp.CogsJsonTests($Job,"PASS")=$get(^CacheTemp.CogsJsonTests($Job,"PASS"))+1	
	} else {
		set ^CacheTemp.CogsJsonTests($Job,"FAILED")=$get(^CacheTemp.CogsJsonTests($Job,"FAILED"))+1
		set ^CacheTemp.CogsJsonTests($Job,"FAILURES",$I(^CacheTemp.CogsJsonTests($Job,"FAILURES")))="Failure in "_..%ClassName(1)_" ("_pDesc_") values do not match..."_$c(13,10,13,10)_pVal1_$c(13,10,13,10)_pVal2_$c(13,10,13,10)
	}
	quit $$$OK
}

ClassMethod AssertContains(pVal1, pVal2, pDesc = "")
{
	if pVal1 [ pVal2 {
		set ^CacheTemp.CogsJsonTests($Job,"PASS")=$get(^CacheTemp.CogsJsonTests($Job,"PASS"))+1	
	} else {
		set ^CacheTemp.CogsJsonTests($Job,"FAILED")=$get(^CacheTemp.CogsJsonTests($Job,"FAILED"))+1
		set ^CacheTemp.CogsJsonTests($Job,"FAILURES",$I(^CacheTemp.CogsJsonTests($Job,"FAILURES")))="Failure in "_..%ClassName(1)_" ("_pDesc_") values do not match..."_$c(13,10,13,10)_pVal1_$c(13,10,13,10)_pVal2_$c(13,10,13,10)
	}
	quit $$$OK
}

ClassMethod AssertNotContains(pVal1, pVal2, pDesc = "")
{
	if pVal1 '[ pVal2 {
		set ^CacheTemp.CogsJsonTests($Job,"PASS")=$get(^CacheTemp.CogsJsonTests($Job,"PASS"))+1	
	} else {
		set ^CacheTemp.CogsJsonTests($Job,"FAILED")=$get(^CacheTemp.CogsJsonTests($Job,"FAILED"))+1
		set ^CacheTemp.CogsJsonTests($Job,"FAILURES",$I(^CacheTemp.CogsJsonTests($Job,"FAILURES")))="Failure in "_..%ClassName(1)_" ("_pDesc_") values do not match..."_$c(13,10,13,10)_pVal1_$c(13,10,13,10)_pVal2_$c(13,10,13,10)
	}
	quit $$$OK
}

}

