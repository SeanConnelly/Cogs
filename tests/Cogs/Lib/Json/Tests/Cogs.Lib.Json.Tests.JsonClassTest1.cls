/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClassTest1 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JSON";

Method Test1() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject1()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
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
	for i=32:1:255 set all=$get(all)_$c(i)
	do ..AssertEquals(testObject2.TestAllAsciiChars,all,"Test TestAllAsciiChars")
	do ..AssertEquals(testObject1.ZTestJsonName,testObject2.ZTestJsonName,"Test JSON name change")
	quit $$$OK
}

Method Test2() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject2()
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match with RAW JSON")
	quit $$$OK
}

Method Test3() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject2()
	set testObject1.TestInteger=0.12345
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,0.12345,"Test decimal number with leading zero 1")
	quit $$$OK
}

Method Test4() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject2()
	set testObject1.TestInteger=.12345
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,.12345,"Test decimal number with leading zero 2")
	quit $$$OK
}

Method Test5() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject2()
	set testObject1.TestInteger=0
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	set json2=testObject2.toJSON("data")
	do ..AssertEquals(json1,json2,"Test serialisation to de-serialisation and back again is an exact match 2")
	do ..AssertEquals(testObject1.TestInteger,0,"Test zero value")
	quit $$$OK
}

Method Test6() As %Status(UNITTEST=1)
{
	set testObject1=..CreateTestObject2()
	set testObject1.TestInteger="012345"
	set json1=testObject1.toJSON("data")
	set testObject2=##class(Cogs.Lib.Json.Tests.UberTestClass).parseJSON(json1,"data")
	do ..AssertEquals(testObject1.TestInteger,"012345","Test leading zero value")
	quit $$$OK
}

ClassMethod CreateTestObject1() As Cogs.Tests.Json.JsonTest
{
	set test=##class(Cogs.Lib.Json.Tests.UberTestClass).%New()
	set test.TestBooleanYes=1
	set test.TestBooleanNo=0
	set test.TestNotBoolean1="true"
	set test.TestNotBoolean2="false"
	set test.TestStringNotNull=""
	set test.TestNullString=$c(0)
	set test.TestNullBoolean=""
	set test.TestNullInteger=""
	set test.TestNullDate=""
	set test.TestStringOfJSON="{""menu"": { ""id"": ""file"", ""value"": ""File"", ""popup"": { ""menuitem"": [ {""value"": ""New"", ""onclick"": ""CreateNewdoc()""}, {""value"": ""Open"", ""onclick"": ""Opendoc()""}, {""value"": ""Close"", ""onclick"": ""Closedoc()""} ] }}}"
	set test.TestInteger=42
	set test.TestDate=+$H
	set test.TestTimestamp="1966-01-27 23:12:02"
	set test.TestTimestampShort="1966-01-27 00:00:00"
	set test.TestTime=4444
	set test.TestEscapes="\""\""/"""_$C(8,9,10,12,13)
	set test.TestIgnoreFlag="WARNING, THIS IS PRIVATE AND SHOULD NOT BE SERIALISED INTO JSON!"
	set test.TestLongString="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
	set test.TestLongNumber=49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	set test.TestString="{[{\}[/][{[""FOO"","""""""""""""""""""""""""""""""""",""BAR""]}]{\}[/]]}"
	for i=32:1:255 set all=$get(all)_$c(i)
	set test.TestAllAsciiChars=all
	do test.TestListOfString.Insert("Sherlock Holmes")
	do test.TestListOfString.Insert("221B Baker Street")
	do test.TestListOfString.Insert("Marylebone")
	do test.TestListOfString.Insert("London W1")
	do test.TestListOfString.Insert("UK")
	do test.TestListOfString.Insert($c(0))
	do test.TestListOfString.Insert("{[{\}[/][{[FOO,BAR]}]{\}[/]]}")
	do test.TestListOfString.Insert("\""\""/"""_$C(8,9,10,12,13))
	do test.TestListOfString.Insert(0)
	do test.TestListOfString.Insert(1)
	do test.TestListOfString.Insert(345345345345345345354.00)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert("")
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfOfDate.Insert(0)
	do test.TestListOfOfDate.Insert(10)
	do test.TestListOfOfDate.Insert(100)
	do test.TestListOfOfDate.Insert(1000)
	do test.TestListOfOfDate.Insert("")
	do test.TestListOfOfDate.Insert(10000)
	do test.TestListOfOfDate.Insert(100000)
	do test.TestListOfOfDate.Insert(1000000)
	do test.TestListOfOfInteger.Insert(0)
	do test.TestListOfOfInteger.Insert(43564356546456)
	do test.TestListOfOfInteger.Insert(0.345)
	do test.TestListOfOfInteger.Insert(.2)
	do test.TestListOfOfInteger.Insert("")
	do test.TestListOfOfInteger.Insert(-464356.75675)
	do test.TestListOfOfInteger.Insert(76567)
	do test.TestListOfOfInteger.Insert(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481)
	do test.TestListOfOfInteger.Insert(7653475667)
	do test.TestListOfOfInteger.Insert(-65753)
	do test.TestListOfOfInteger.Insert(45676.56)
	do test.TestListOfOfInteger.Insert(-78456/101+100*345/34.3)
	do test.TestArrayOfBoolean.SetAt(1,"ALPHA")
	do test.TestArrayOfBoolean.SetAt(0,"CHARLIE")
	do test.TestArrayOfBoolean.SetAt("","DELTA")
	do test.TestArrayOfBoolean.SetAt(0,"ECHO")
	do test.TestArrayOfBoolean.SetAt(1,"FOXTROT")
	do test.TestArrayOfString.SetAt("Sherlock Holmes","Detective")
	do test.TestArrayOfString.SetAt("221B Baker Street","Street")
	do test.TestArrayOfString.SetAt("Marylebone","District")
	do test.TestArrayOfString.SetAt("London W1","City")
	do test.TestArrayOfString.SetAt("UK","Country")
	do test.TestArrayOfString.SetAt("\""\""/"""_$C(8,9,10,12,13),"b4d,Th1ng5!")
	do test.TestArrayOfString.SetAt("{[{\}[/][{[FOO,BAR]}]{\}[/]]}","FOOBAR")
	do test.TestArrayOfString.SetAt($c(0),"nully")
	do test.TestArrayOfString.SetAt("","not-nully")
	do test.TestArrayOfDate.SetAt(0,"Happy-Horolog :)")
	do test.TestArrayOfDate.SetAt(+$H,"doB")
	do test.TestArrayOfDate.SetAt($H+40000,"doB")
	do test.TestArrayOfDate.SetAt("","nully")
	do test.TestArrayOfInteger.SetAt(1,"ONE")
	do test.TestArrayOfInteger.SetAt(2,"TWO")
	do test.TestArrayOfInteger.SetAt(3,"THREE")
	do test.TestArrayOfInteger.SetAt(99,"NINETY NINE")
	do test.TestArrayOfInteger.SetAt(1000,"A THOUSAND!")
	do test.TestArrayOfInteger.SetAt(59546526326827,"WORLD DEBT $")
	do test.TestArrayOfInteger.SetAt(241000000000000,"WORLD WORTH $")
	do test.TestArrayOfInteger.SetAt("","nully")
	set test.ZTestJsonName="FOO"
	Quit test
}

ClassMethod CreateTestObject2() As Cogs.Tests.Json.JsonTest
{
	set test=##class(Cogs.Lib.Json.Tests.UberTestClass).%New()
	set test.TestBooleanYes=1
	set test.TestBooleanNo=0
	set test.TestNotBoolean1="true"
	set test.TestNotBoolean2="false"
	set test.TestStringNotNull=""
	set test.TestNullString=$c(0)
	set test.TestNullBoolean=""
	set test.TestNullInteger=""
	set test.TestNullDate=""
	set test.TestStringOfJSON="{""menu"": { ""id"": ""file"", ""value"": ""File"", ""popup"": { ""menuitem"": [ {""value"": ""New"", ""onclick"": ""CreateNewdoc()""}, {""value"": ""Open"", ""onclick"": ""Opendoc()""}, {""value"": ""Close"", ""onclick"": ""Closedoc()""} ] }}}"
	set test.TestInteger=42
	set test.TestDate=+$H
	set test.TestTimestamp="1966-01-27 23:12:02"
	set test.TestTimestampShort="1966-01-27 00:00:00"
	set test.TestTime=4444
	set test.TestEscapes="\""\""/"""_$C(8,9,10,12,13)
	set test.TestIgnoreFlag="WARNING, THIS IS PRIVATE AND SHOULD NOT BE SERIALISED INTO JSON!"
	set test.TestLongString="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"
	set test.TestLongNumber=49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
	set test.TestString="{[{\}[/][{[""FOO"","""""""""""""""""""""""""""""""""",""BAR""]}]{\}[/]]}"
	set test.TestRawJson="{""TestAllAsciiChars"":"" !\""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]"_$c(142,143,144,145,146,147,148,149,150,151,152,153,154,157,158,159)_" ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"",""TestArrayOfBoolean"":{""ALPHA"":true,""CHARLIE"":false,""DELTA"":null,""ECHO"":false,""FOXTROT"":true},""TestArrayOfDate"":{""Happy-Horolog :)"":""1840-12-31"",""doB"":""2126-12-06"",""nully"":null},""TestArrayOfInteger"":{""A THOUSAND!"":1000,""NINETY NINE"":99,""ONE"":1,""THREE"":3,""TWO"":2,""WORLD DEBT $"":59546526326827,""WORLD WORTH $"":241000000000000,""nully"":0},""TestArrayOfObject"":{},""TestArrayOfString"":{""City"":""London W1"",""Country"":""UK"",""Detective"":""Sherlock Holmes"",""District"":""Marylebone"",""FOOBAR"":""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""Street"":""221B Baker Street"",""b4d,Th1ng5!"":""\\\""\\\""/\""\b\t\r\f\n"",""not-nully"":"""",""nully"":null},""TestBooleanNo"":false,""TestBooleanYes"":true,""TestDate"":""2017-05-31"",""TestEmptyArrayOfBoolean"":{},""TestEmptyArrayOfDate"":{},""TestEmptyArrayOfInteger"":{},""TestEmptyArrayOfString"":{},""TestEmptyListOfBoolean"":[],""TestEmptyListOfOfDate"":[],""TestEmptyListOfOfInteger"":[],""TestEmptyListOfString"":[],""TestEscapes"":""\\\""\\\""/\""\b\t\r\f\n"",""TestInteger"":42,""TestListOfBoolean"":[true,false,false,null,true,false,true,true,false],""TestListOfObject"":[],""TestListOfOfDate"":[""1840-12-31"",""1841-01-10"",""1841-04-10"",""1843-09-27"",null,""1868-05-18"",""2114-10-16"",""4578-11-27""],""TestListOfOfInteger"":[0,43564356546456,0.345,0.2,0,-464356.75675,76567,3.141592653589793238,7653475667,-65753,45676.56,-6807.383887076754324],""TestListOfString"":[""Sherlock Holmes"",""221B Baker Street"",""Marylebone"",""London W1"",""UK"",null,""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""\\\""\\\""/\""\b\t\r\f\n"",""0"",""1"",""345345345345345345400""],""TestLongNumber"":49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,""TestLongString"":""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"",""TestNotBoolean1"":""true"",""TestNotBoolean2"":""false"",""TestNullBoolean"":null,""TestNullDate"":null,""TestNullInteger"":0,""TestNullString"":null,""TestNullTimestamp"":null,""TestRawJson"":{""data"":{""TestAllAsciiChars"":"" !\""#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUV"_$c(142,143,144,145,146,147,148,149,150,151,152,153,154,157,158,159)_" ¡¢£¤¥¦§¨©ª«¬­®¯°±²³´µ¶·¸¹º»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþÿ"",""TestArrayOfBoolean"":{""ALPHA"":true,""CHARLIE"":false,""DELTA"":null,""ECHO"":false,""FOXTROT"":true},""TestArrayOfDate"":{""Happy-Horolog :)"":""1840-12-31"",""doB"":""2125-11-27"",""nully"":null},""TestArrayOfInteger"":{""A THOUSAND!"":1000,""NINETY NINE"":99,""ONE"":1,""THREE"":3,""TWO"":2,""WORLD DEBT $"":59546526326827,""WORLD WORTH $"":241000000000000,""nully"":null},""TestArrayOfObject"":{},""TestArrayOfString"":{""City"":""London W1"",""Country"":""UK"",""Detective"":""Sherlock Holmes"",""District"":""Marylebone"",""FOOBAR"":""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""Street"":""221B Baker Street"",""b4d,Th1ng5!"":""\\\""\\\""/\""\b\t\r\f\n"",""not-nully"":"""",""nully"":null},""TestBooleanNo"":false,""TestBooleanYes"":true,""TestDate"":""2016-05-22"",""TestEmptyArrayOfBoolean"":{},""TestEmptyArrayOfDate"":{},""TestEmptyArrayOfInteger"":{},""TestEmptyArrayOfString"":{},""TestEmptyListOfBoolean"":[],""TestEmptyListOfOfDate"":[],""TestEmptyListOfOfInteger"":[],""TestEmptyListOfString"":[],""TestEscapes"":""\\\""\\\""/\""\b\t\r\f\n"",""TestInteger"":42,""TestListOfBoolean"":[true,false,false,null,true,false,true,true,false],""TestListOfObject"":[],""TestListOfOfDate"":[""1840-12-31"",""1841-01-10"",""1841-04-10"",""1843-09-27"",null,""1868-05-18"",""2114-10-16"",""4578-11-27""],""TestListOfOfInteger"":[""0"",43564356546456,0.345,0.2,null,-464356.75675,76567,3.141592653589793238,7653475667,-65753,45676.56,-6807.383887076754324],""TestListOfString"":[""Sherlock Holmes"",""221B Baker Street"",""Marylebone"",""London W1"",""UK"",null,""{[{\\}[/][{[FOO,BAR]}]{\\}[/]]}"",""\\\""\\\""/\""\b\t\r\f\n"",""0"",""1"",""345345345345345345400""],""TestLongNumber"":49947976805055875840000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000,""TestLongString"":""Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"",""TestNotBoolean1"":""true"",""TestNotBoolean2"":""false"",""TestNullBoolean"":null,""TestNullDate"":null,""TestNullInteger"":null,""TestNullString"":null,""TestNullTimestamp"":null,""TestRawJson"":"""",""TestSingleObject"":"""",""TestString"":""{[{\\}[/][{[\""FOO\"",\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\"",\""BAR\""]}]{\\}[/]]}"",""TestStringNotNull"":"""",""TestStringOfJSON"":""{\""menu\"": { \""id\"": \""file\"", \""value\"": \""File\"", \""popup\"": { \""menuitem\"": [ {\""value\"": \""New\"", \""onclick\"": \""CreateNewdoc()\""}, {\""value\"": \""Open\"", \""onclick\"": \""Opendoc()\""}, {\""value\"": \""Close\"", \""onclick\"": \""Closedoc()\""} ] }}}"",""TestTimestamp"":""1966-01-27T23:12:02"",""TestTimestampShort"":""1966-01-27T00:00:00"",""_id"":""FOO""}},""TestSingleObject"":"""",""TestString"":""{[{\\}[/][{[\""FOO\"",\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\""\"",\""BAR\""]}]{\\}[/]]}"",""TestStringNotNull"":"""",""TestStringOfJSON"":""{\""menu\"": { \""id\"": \""file\"", \""value\"": \""File\"", \""popup\"": { \""menuitem\"": [ {\""value\"": \""New\"", \""onclick\"": \""CreateNewdoc()\""}, {\""value\"": \""Open\"", \""onclick\"": \""Opendoc()\""}, {\""value\"": \""Close\"", \""onclick\"": \""Closedoc()\""} ] }}}"",""TestTime"":""01:14:04"",""TestTimestamp"":""1966-01-27T23:12:02"",""TestTimestampShort"":""1966-01-27T00:00:00"",""TestZero"":0,""ZTestJsonMethod"":""LOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM. SED UT PERSPICIATIS UNDE OMNIS ISTE NATUS ERROR SIT VOLUPTATEM ACCUSANTIUM DOLOREMQUE LAUDANTIUM, TOTAM REM APERIAM, EAQUE IPSA QUAE AB ILLO INVENTORE VERITATIS ET QUASI ARCHITECTO BEATAE VITAE DICTA SUNT EXPLICABO. NEMO ENIM IPSAM VOLUPTATEM QUIA VOLUPTAS SIT ASPERNATUR AUT ODIT AUT FUGIT, SED QUIA CONSEQUUNTUR MAGNI DOLORES EOS QUI RATIONE VOLUPTATEM SEQUI NESCIUNT. NEQUE PORRO QUISQUAM EST, QUI DOLOREM IPSUM QUIA DOLOR SIT AMET, CONSECTETUR, ADIPISCI VELIT, SED QUIA NON NUMQUAM EIUS MODI TEMPORA INCIDUNT UT LABORE ET DOLORE MAGNAM ALIQUAM QUAERAT VOLUPTATEM. UT ENIM AD MINIMA VENIAM, QUIS NOSTRUM EXERCITATIONEM ULLAM CORPORIS SUSCIPIT LABORIOSAM, NISI UT ALIQUID EX EA COMMODI CONSEQUATUR? QUIS AUTEM VEL EUM IURE REPREHENDERIT QUI IN EA VOLUPTATE VELIT ESSE QUAM NIHIL MOLESTIAE CONSEQUATUR, VEL ILLUM QUI DOLOREM EUM FUGIAT QUO VOLUPTAS NULLA PARIATUR?"",""_id"":""FOO""}"
	for i=32:1:255 set all=$get(all)_$c(i)
	set test.TestAllAsciiChars=all
	do test.TestListOfString.Insert("Sherlock Holmes")
	do test.TestListOfString.Insert("221B Baker Street")
	do test.TestListOfString.Insert("Marylebone")
	do test.TestListOfString.Insert("London W1")
	do test.TestListOfString.Insert("UK")
	do test.TestListOfString.Insert($c(0))
	do test.TestListOfString.Insert("{[{\}[/][{[FOO,BAR]}]{\}[/]]}")
	do test.TestListOfString.Insert("\""\""/"""_$C(8,9,10,12,13))
	do test.TestListOfString.Insert(0)
	do test.TestListOfString.Insert(1)
	do test.TestListOfString.Insert(345345345345345345354.00)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert("")
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(1)
	do test.TestListOfBoolean.Insert(0)
	do test.TestListOfOfDate.Insert(0)
	do test.TestListOfOfDate.Insert(10)
	do test.TestListOfOfDate.Insert(100)
	do test.TestListOfOfDate.Insert(1000)
	do test.TestListOfOfDate.Insert("")
	do test.TestListOfOfDate.Insert(10000)
	do test.TestListOfOfDate.Insert(100000)
	do test.TestListOfOfDate.Insert(1000000)
	do test.TestListOfOfInteger.Insert(0)
	do test.TestListOfOfInteger.Insert(43564356546456)
	do test.TestListOfOfInteger.Insert(0.345)
	do test.TestListOfOfInteger.Insert(.2)
	do test.TestListOfOfInteger.Insert("")
	do test.TestListOfOfInteger.Insert(-464356.75675)
	do test.TestListOfOfInteger.Insert(76567)
	do test.TestListOfOfInteger.Insert(3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825342117067982148086513282306647093844609550582231725359408128481)
	do test.TestListOfOfInteger.Insert(7653475667)
	do test.TestListOfOfInteger.Insert(-65753)
	do test.TestListOfOfInteger.Insert(45676.56)
	do test.TestListOfOfInteger.Insert(-78456/101+100*345/34.3)
	do test.TestArrayOfBoolean.SetAt(1,"ALPHA")
	do test.TestArrayOfBoolean.SetAt(0,"CHARLIE")
	do test.TestArrayOfBoolean.SetAt("","DELTA")
	do test.TestArrayOfBoolean.SetAt(0,"ECHO")
	do test.TestArrayOfBoolean.SetAt(1,"FOXTROT")
	do test.TestArrayOfString.SetAt("Sherlock Holmes","Detective")
	do test.TestArrayOfString.SetAt("221B Baker Street","Street")
	do test.TestArrayOfString.SetAt("Marylebone","District")
	do test.TestArrayOfString.SetAt("London W1","City")
	do test.TestArrayOfString.SetAt("UK","Country")
	do test.TestArrayOfString.SetAt("\""\""/"""_$C(8,9,10,12,13),"b4d,Th1ng5!")
	do test.TestArrayOfString.SetAt("{[{\}[/][{[FOO,BAR]}]{\}[/]]}","FOOBAR")
	do test.TestArrayOfString.SetAt($c(0),"nully")
	do test.TestArrayOfString.SetAt("","not-nully")
	do test.TestArrayOfDate.SetAt(0,"Happy-Horolog :)")
	do test.TestArrayOfDate.SetAt(+$H,"doB")
	do test.TestArrayOfDate.SetAt($H+40000,"doB")
	do test.TestArrayOfDate.SetAt("","nully")
	do test.TestArrayOfInteger.SetAt(1,"ONE")
	do test.TestArrayOfInteger.SetAt(2,"TWO")
	do test.TestArrayOfInteger.SetAt(3,"THREE")
	do test.TestArrayOfInteger.SetAt(99,"NINETY NINE")
	do test.TestArrayOfInteger.SetAt(1000,"A THOUSAND!")
	do test.TestArrayOfInteger.SetAt(59546526326827,"WORLD DEBT $")
	do test.TestArrayOfInteger.SetAt(241000000000000,"WORLD WORTH $")
	do test.TestArrayOfInteger.SetAt("","nully")
	set test.ZTestJsonName="FOO"
	Quit test
}

}

