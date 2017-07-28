/// Copyright (c) 2017 MemCog Ltd
/// Test fix for repeating object references
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest4 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JsonClassSuite";

Method Test1() As %Status(UNITTEST=1)
{
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1()
	set json1=uber.toJSON()
	set json2=..GetOutputJson(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject1())
	do ..AssertEquals(json1,json2,"outputJSON should equal toJSON 1")
	quit $$$OK
}

Method Test2() As %Status(UNITTEST=1)
{
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4()
	set json1=uber.toJSON()
	set json2=..GetOutputJson(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4())
	do ..AssertEquals(json1,json2,"outputJSON should equal toJSON 2")
	quit $$$OK
}

Method Test3() As %Status(UNITTEST=1)
{
	set uber=##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject5()
	set json1=uber.toJSON()
	set json2=..GetOutputJson(##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject5())
	do ..AssertEquals(json1,json2,"outputJSON should equal toJSON 3")
	quit $$$OK
}

Method Test4() As %Status(UNITTEST=1)
{
	set json="{""MandateListDto"": [{""Id"": ""40444019-fb52-40bd-82fa-be3d51a90ac8"",""Name"": ""TestDebtor"",""CreationDateUtc"": ""2017-07-15T08:25:59.6670000Z"",""MandateStatus"": {""Status"": ""Rejected"",""AuthenticationDate"": ""2017-07-15T00:00:00.0000000Z"",""MandateBankReferenceNumber"": """",""RejectReasons"": [""""]}}],""PageIndex"": 1,""PageSize"": 1,""ErrorList"": [],""ResponseUtcTime"": ""2017-07-16T10:28:42.8798267Z"",""UserFriendlyDisplayList"": []}"
	set json2="{""ErrorList"":[],""MandateListDto"":[{""CreationDateUtc"":""2017-07-15T08:25:59.6670000Z"",""Id"":""40444019-fb52-40bd-82fa-be3d51a90ac8"",""MandateStatus"":{""AuthenticationDate"":""2017-07-15T00:00:00.0000000Z"",""MandateBankReferenceNumber"":"""",""RejectReasons"":[""""],""Status"":""Rejected""},""Name"":""TestDebtor""}],""PageIndex"":1,""PageSize"":1,""ResponseUtcTime"":""2017-07-16T10:28:42.8798267Z"",""UserFriendlyDisplayList"":[]}"
	#dim main as Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass
	set main=##class(Cogs.JsonObject).parseJSON(json,"Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass")
	set json3=##class(Cogs.JsonObject).toJSON(main)
	set json4=main.toJSON()
	set json5=..GetOutputJson(main)
	do ..AssertEquals(json2,json3,"json should be the same 1")
	do ..AssertEquals(json2,json4,"json should be the same 2")
	do ..AssertEquals(json2,json5,"json should be the same 3")
	do ..AssertEquals(json3,json4,"json should be the same 4")
	do ..AssertEquals(json3,json5,"json should be the same 5")
	quit $$$OK
}

Method GetOutputJson(obj) As %String
{
    set tInitIO = $IO
    set %ISCJSONStream=##class(%Stream.TmpCharacter).%New()
    use tInitIO::("^%ZEN.Auxiliary.jsonProvider.1")
    do ##class(%Library.Device).ReDirectIO(1)
    do obj.outputJSON()
    if ##class(%Library.Device).ReDirectIO(0) Use tInitIO
    do %ISCJSONStream.Rewind()
    set string=%ISCJSONStream.Read($zutil(96,39))
    quit string
}

}

