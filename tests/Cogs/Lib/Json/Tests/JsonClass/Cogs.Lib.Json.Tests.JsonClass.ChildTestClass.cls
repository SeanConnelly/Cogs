/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.JsonClass.ChildTestClass Extends (%Persistent, Cogs.JsonClass)
{

Property Parent As Cogs.Lib.Json.Tests.JsonClass.ParentTestClass;

Property SameParent As Cogs.Lib.Json.Tests.JsonClass.ParentTestClass;

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
<Value>SameParent</Value>
</Value>
<Value name="4">
<Value>Bar</Value>
</Value>
</Data>
<DataLocation>^Cogs.Lib.Js7A8C.ChildTestClassD</DataLocation>
<DefaultData>ChildTestClassDefaultData</DefaultData>
<ExtentSize>100000</ExtentSize>
<IdLocation>^Cogs.Lib.Js7A8C.ChildTestClassD</IdLocation>
<IndexLocation>^Cogs.Lib.Js7A8C.ChildTestClassI</IndexLocation>
<StreamLocation>^Cogs.Lib.Js7A8C.ChildTestClassS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}

