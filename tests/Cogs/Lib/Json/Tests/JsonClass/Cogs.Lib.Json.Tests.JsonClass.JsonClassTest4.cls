/// Copyright (c) 2017 MemCog Ltd
/// Test fix for repeating object references
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest4 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JSON";

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
    set ^debug($zh,"len")=$l(string)
    quit string
}

}

