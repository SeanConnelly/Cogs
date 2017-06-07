Class Cogs.Lib.Json.Tests.ChildTestClass Extends (%Persistent, Cogs.JsonClass)
{

Property Parent As Cogs.Lib.Json.Tests.ParentTestClass;

Property SameParent As Cogs.Lib.Json.Tests.ParentTestClass;

Property Bar As %String;

Storage Default
{
<Data name="ChildTestClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Parent</Value>
</Value>
<Value name="3">
<Value>Foo</Value>
</Value>
<Value name="4">
<Value>Bar</Value>
</Value>
<Value name="5">
<Value>SameParent</Value>
</Value>
</Data>
<DataLocation>^Cogs.Lib.Js363E.ChildTestClassD</DataLocation>
<DefaultData>ChildTestClassDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Cogs.Lib.Js363E.ChildTestClassD</IdLocation>
<IndexLocation>^Cogs.Lib.Js363E.ChildTestClassI</IndexLocation>
<StreamLocation>^Cogs.Lib.Js363E.ChildTestClassS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

