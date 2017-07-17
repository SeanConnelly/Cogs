Class Cogs.Lib.Json.Tests.JsonClass.Issue4TestClass Extends (%Persistent, Cogs.JsonClass)
{

Property Child As Cogs.Lib.Json.Tests.JsonClass.ChildTestClass;

Property SameChild As Cogs.Lib.Json.Tests.JsonClass.ChildTestClass;

Property Foo As %String;

<Storage name="Default">
<Data name="Issue4TestClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Child</Value>
</Value>
<Value name="3">
<Value>SameChild</Value>
</Value>
<Value name="4">
<Value>Foo</Value>
</Value>
</Data>
<DataLocation>^Cogs.Lib.J7A8C.Issue4TestCD18FD</DataLocation>
<DefaultData>Issue4TestClassDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Cogs.Lib.J7A8C.Issue4TestCD18FD</IdLocation>
<IndexLocation>^Cogs.Lib.J7A8C.Issue4TestCD18FI</IndexLocation>
<StreamLocation>^Cogs.Lib.J7A8C.Issue4TestCD18FS</StreamLocation>
<Type>%Library.CacheStorage</Type>
</Storage>
}

