/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest1 Extends Cogs.Lib.Json.Tests.Runner
{

ClassMethod Test1() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	for i=0:1:127 set all=$get(all)_$c(i)
	do ..AssertEquals(testObject1.TestAllAsciiChars,all,"Test all ASCII characters 1")
	do ..AssertEquals(testObject2.TestAllAsciiChars,all,"Test all ASCII characters 2")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match 1")
	do ..AssertNotEquals(testObject1.TestIgnoreFlag,testObject2.TestIgnoreFlag,"test TestIgnoreFlag property has been ignored 1")
	do ..AssertNotContains(json1,"TestIgnoreFlag","test TestIgnoreFlag property has been ignored 2")
	do ..AssertNotEquals(testObject1.ZTestJsonMethod,testObject2.ZTestJsonMethod,"test ZTestJsonMethod property has been overriden 1")
	do ..AssertEquals(testObject1.TestLongString,"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?","Test long string is correct")
	do ..AssertContains(json1,"""ZTestJsonMethod"":""LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM. SED UT PERSPICIATIS UNDE OMNIS ISTE NATUS ERROR SIT VOLUPTATEM ACCUSANTIUM DOLOREMQUE LAUDANTIUM, TOTAM REM APERIAM, EAQUE IPSA QUAE AB ILLO INVENTORE VERITATIS ET QUASI ARCHITECTO BEATAE VITAE DICTA SUNT EXPLICABO. NEMO ENIM IPSAM VOLUPTATEM QUIA VOLUPTAS SIT ASPERNATUR AUT ODIT AUT FUGIT, SED QUIA CONSEQUUNTUR MAGNI DOLORES EOS QUI RATIONE VOLUPTATEM SEQUI NESCIUNT. NEQUE PORRO QUISQUAM EST, QUI DOLOREM IPSUM QUIA DOLOR SIT AMET, CONSECTETUR, ADIPISCI VELIT, SED QUIA NON NUMQUAM EIUS MODI TEMPORA INCIDUNT UT LABORE ET DOLORE MAGNAM ALIQUAM QUAERAT VOLUPTATEM. UT ENIM AD MINIMA VENIAM, QUIS NOSTRUM EXERCITATIONEM ULLAM CORPORIS SUSCIPIT LABORIOSAM, NISI UT ALIQUID EX EA COMMODI CONSEQUATUR? QUIS AUTEM VEL EUM IURE REPREHENDERIT QUI IN EA VOLUPTATE VELIT ESSE QUAM NIHIL MOLESTIAE CONSEQUATUR, VEL ILLUM QUI DOLOREM EUM FUGIAT QUO VOLUPTAS NULLA PARIATUR?""","Test ZTestJsonMethod is serialised correctly")
	do ..AssertContains(json1,"_id","test _id property name exists")
	do ..AssertEquals(testObject2.TestBooleanYes,1,"Test TestBooleanYes")
	do ..AssertEquals(testObject2.TestBooleanNo,0,"Test TestBooleanNo")
	do ..AssertEquals(testObject2.TestNotBoolean1,"true","Test TestNotBoolean1")
	do ..AssertEquals(testObject2.TestNotBoolean2,"false","Test TestNotBoolean2")
	do ..AssertEquals(testObject2.TestStringNotNull,"","Test TestStringNotNull")
	do ..AssertEquals(testObject2.TestNullString,$c(0),"Test TestNullString")
	do ..AssertEquals(testObject2.TestNullBoolean,"","Test TestNullBoolean")
	do ..AssertEquals(testObject1.TestNullInteger,"","Test TestNullInteger 1")
	do ..AssertEquals(testObject2.TestNullInteger,"","Test TestNullInteger 2")
	do ..AssertEquals(testObject2.TestNullDate,"","Test TestNullDate")
	do ..AssertEquals(testObject2.TestStringOfJSON,"{""menu"": { ""id"": ""file"", ""value"": ""File"", ""popup"": { ""menuitem"": [ {""value"": ""New"", ""onclick"": ""CreateNewdoc()""}, {""value"": ""Open"", ""onclick"": ""Opendoc()""}, {""value"": ""Close"", ""onclick"": ""Closedoc()""} ] }}}","Test TestStringOfJSON")
	do ..AssertEquals(testObject2.TestInteger,42,"Test TestInteger")
	do ..AssertEquals(testObject2.TestDate,+$H,"Test TestDate")
	do ..AssertEquals(testObject2.TestTimestamp,"1966-01-27 23:12:02","Test TestTimestamp")
	do ..AssertEquals(testObject2.TestTimestampShort,"1966-01-27 00:00:00","Test TestTimestampShort")
	do ..AssertEquals(testObject2.TestTime,4444,"Test TestTime")
	do ..AssertEquals(testObject2.TestEscapes,"\""\""/"""_$C(8,9,10,12,13),"Test TestEscapes")
	do ..AssertNotEquals(testObject2.TestIgnoreFlag,"WARNING, THIS IS PRIVATE AND SHOULD NOT BE SERIALISED INTO JSON!","Test TestIgnoreFlag 1")
	do ..AssertEquals(testObject2.TestIgnoreFlag,"","Test TestIgnoreFlag 2")
	do ..AssertEquals(testObject2.TestLongString,"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?","Test TestLongString")
	do ..AssertEquals(testObject2.TestLongNumber,49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,"Test TestLongNumber")
	do ..AssertEquals(testObject2.TestString,"{[{\}[/][{[""FOO"","""""""""""""""""""""""""""""""""",""BAR""]}]{\}[/]]}","Test TestString")
	do ..AssertEquals(testObject1.ZTestJsonName,testObject2.ZTestJsonName,"Test JSON name change")
	quit $$$OK
}

ClassMethod Test2() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject2()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match with RAW JSON")
	quit $$$OK
}

ClassMethod Test3() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject2()
	set testObject1.TestInteger=0.12345
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,0.12345,"Test decimal number with leading zero 1")
	quit $$$OK
}

ClassMethod Test4() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject2()
	set testObject1.TestInteger=.12345
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,.12345,"Test decimal number with leading zero 2")
	quit $$$OK
}

ClassMethod Test5() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject2()
	set testObject1.TestInteger=0
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match 2")
	do ..AssertEquals(testObject1.TestInteger,0,"Test zero value")
	quit $$$OK
}

ClassMethod Test6() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject2()
	set testObject1.TestInteger="012345"
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,"012345","Test leading zero value")
	quit $$$OK
}

ClassMethod Test7() As %Status(UNITTEST=1)
{
	set checkObject=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1()
	set checkJson=checkObject.toJSON()
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject3()
	do ..AssertEquals(testObject1.toJSON(),testObject1.toJSON(),"Very large JSON object should match iteself")	
	set json1=testObject1.toJSON()
	#dim testObject2 as Cogs.Lib.Json.Tests.JsonClass.UberTestClass
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1)
	set json2=testObject2.TestSingleObject.toJSON()
	do ..AssertEquals(checkJson,json2,"Single object should match original")
	set json3=testObject2.TestListOfObject.GetAt(1).toJSON()
	do ..AssertEquals(checkJson,json3,"List object 1 should match original")
	set json4=testObject2.TestListOfObject.GetAt(2).toJSON()
	do ..AssertEquals(checkJson,json4,"List object 2 should match original")
	set json5=testObject2.TestListOfObject.GetAt(3).toJSON()
	do ..AssertEquals(checkJson,json5,"List object 3 should match original")
	set json6=testObject2.TestArrayOfObject.GetAt("TEST3.1").toJSON()
	do ..AssertEquals(checkJson,json6,"Array object 1 should match original")
	set json7=testObject2.TestArrayOfObject.GetAt("TEST3.2").toJSON()
	do ..AssertEquals(checkJson,json7,"Array object 2 should match original")
	set json8=testObject2.TestArrayOfObject.GetAt("TEST3.3").toJSON()
	do ..AssertEquals(checkJson,json8,"Array object 3 should match original")
	quit $$$OK
}

ClassMethod Test8() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match with RAW JSON 2")
	quit $$$OK
}

ClassMethod Test9() As %Status(UNITTEST=1)
{
	set testObject1=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match with RAW JSON 3")
	quit $$$OK
}

}

