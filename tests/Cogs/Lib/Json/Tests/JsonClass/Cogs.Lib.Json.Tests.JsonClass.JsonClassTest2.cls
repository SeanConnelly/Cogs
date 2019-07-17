/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest2 Extends Cogs.Lib.Json.Tests.Runner
{

ClassMethod OnBeforeAllTests() As %Status
{
	do ##class(Cogs.Lib.Json.Tests.JsonClass.StoredTestClass).%DeleteExtent()
	Quit $$$OK
}

ClassMethod Test1() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.JsonClass.StoredTestClass).%New()
	set person.FirstName="Sean"
	set person.LastName="Connelly"
	set person.DateOfBirth=47379
	set person.Secret="Luna"
	do person.Hobbies.Insert("Photography")
	do person.Hobbies.Insert("Football")
	do person.Hobbies.Insert("Walking")
	set sc=person.%Save()
	do ..AssertEquals(sc,$$$OK,"person should save ok 1")
	quit $$$OK
}

ClassMethod Test2() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.JsonClass.StoredTestClass).%OpenId(1)
	set json=person.toJSON()
	do ..AssertEquals(json,"{""BirthDate"":""1970-09-20"",""FirstName"":""Sean"",""Hobbies"":[""Photography"",""Football"",""Walking""],""LastName"":""Connelly""}","json string is correct")
	quit $$$OK
}

ClassMethod Test3() As %Status(UNITTEST=1)
{
	set json="{""BirthDate"":""1970-09-20"",""FirstName"":""Sean"",""Hobbies"":[""Photography"",""Football"",""Walking""],""LastName"":""Connelly""}"
	set person=##class(Cogs.Lib.Json.Tests.JsonClass.StoredTestClass).parseJSON(json)
	set sc=person.%Save()
	do ..AssertEquals(sc,$$$OK,"person should save ok 1")
	quit $$$OK
}

ClassMethod Test4() As %Status(UNITTEST=1)
{
	set person=##class(Cogs.Lib.Json.Tests.JsonClass.StoredTestClass).%OpenId(1)
	do ..AssertEquals(person.FirstName,"Sean","Test FirstName is correct")
	do ..AssertEquals(person.LastName,"Connelly","Test LastName is correct")
	do ..AssertEquals(person.DateOfBirth,47379,"Test DateOfBirth is correct")
	do ..AssertEquals(person.Hobbies.GetAt(1),"Photography","Test Hobbies 1 is correct")
	do ..AssertEquals(person.Hobbies.GetAt(2),"Football","Test Hobbies 2 is correct")
	do ..AssertEquals(person.Hobbies.GetAt(3),"Walking","Test Hobbies 3 is correct")
	quit $$$OK
}

}

