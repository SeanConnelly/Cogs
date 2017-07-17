/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClass.StoredTestClass Extends (%Persistent, Cogs.JsonClass)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %Date(JSONNAME = "BirthDate");

Property Secret As %String(JSONIGNORE = 1);

Property Hobbies As list Of %String;

<Storage name="Default">
<Data name="StoredTestClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>DateOfBirth</Value>
</Value>
<Value name="5">
<Value>Secret</Value>
</Value>
<Value name="6">
<Value>Hobbies</Value>
</Value>
</Data>
<DataLocation>^Cogs.Lib.J7A8C.StoredTestCCBCAD</DataLocation>
<DefaultData>StoredTestClassDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Cogs.Lib.J7A8C.StoredTestCCBCAD</IdLocation>
<IndexLocation>^Cogs.Lib.J7A8C.StoredTestCCBCAI</IndexLocation>
<StreamLocation>^Cogs.Lib.J7A8C.StoredTestCCBCAS</StreamLocation>
<Type>%Library.CacheStorage</Type>
</Storage>
}

