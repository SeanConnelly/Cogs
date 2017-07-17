Class Cogs.Lib.Json.Tests.JsonClass.ParentTestClass Extends (%Persistent, Cogs.JsonClass)
{

Property Child As Cogs.Lib.Json.Tests.JsonClass.ChildTestClass;

Property SameChild As Cogs.Lib.Json.Tests.JsonClass.ChildTestClass;

Property Foo As %String;

<Storage name="Default">
<Data name="ParentTestClassDefaultData">
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
<DataLocation>^Cogs.Lib.J7A8C.ParentTestC47A0D</DataLocation>
<DefaultData>ParentTestClassDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Cogs.Lib.J7A8C.ParentTestC47A0D</IdLocation>
<IndexLocation>^Cogs.Lib.J7A8C.ParentTestC47A0I</IndexLocation>
<StreamLocation>^Cogs.Lib.J7A8C.ParentTestC47A0S</StreamLocation>
<Type>%Library.CacheStorage</Type>
</Storage>
}

