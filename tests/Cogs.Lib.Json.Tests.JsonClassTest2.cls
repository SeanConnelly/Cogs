/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClassTest2 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JSON";

Method OnBeforeAllTests() As %Status
{
	//do ##class(Cogs.Lib.Json.Tests.StoredTestClass).%DeleteExtent()
	Quit $$$OK
}

Method Test1() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.StoredTestClass).%New()
	set person.FirstName="Sean"
	set person.LastName="Connelly"
	set person.DateOfBirth=47379
	set person.Secret="Luna"
	do person.Hobbies.Insert("Photography")
	do person.Hobbies.Insert("Football")
	do person.Hobbies.Insert("Walking")
	set sc=person.%Save()
	do ..AssertEquals(sc,$$$OK,"person saves ok")
	quit $$$OK
}

Method Test2() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.StoredTestClass).%OpenId(1)
	set json=person.toJSON()
	do ..AssertEquals(json,"{""BirthDate"":""1970-09-20"",""FirstName"":""Sean"",""Hobbies"":[""Photography"",""Football"",""Walking""],""LastName"":""Connelly""}","json string is correct")
	quit $$$OK
}

Method Test3() As %Status(UNITTEST=1)
{
	set json="{""BirthDate"":""1970-09-20"",""FirstName"":""Sean"",""Hobbies"":[""Photography"",""Football"",""Walking""],""LastName"":""Connelly""}"
	set person=##class(Cogs.Lib.Json.Tests.StoredTestClass).parseJSON(json)
	set sc=person.%Save()
	do ..AssertEquals(sc,$$$OK,"person saves ok")
	quit $$$OK
}

Method Test4() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.StoredTestClass).%OpenId(2)
	do ..AssertEquals(person.FirstName,"Sean","Test FirstName is correct")
	do ..AssertEquals(person.LastName,"Connelly","Test LastName is correct")
	do ..AssertEquals(person.DateOfBirth,47379,"Test DateOfBirth is correct")
	do ..AssertEquals(person.Hobbies.GetAt(1),"Photography","Test Hobbies 1 is correct")
	do ..AssertEquals(person.Hobbies.GetAt(2),"Football","Test Hobbies 2 is correct")
	do ..AssertEquals(person.Hobbies.GetAt(3),"Walking","Test Hobbies 3 is correct")
	do ..AssertEquals(person.Secret,"","Test Secret is empty")
	quit $$$OK
}

}

