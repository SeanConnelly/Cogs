/// Copyright (c) 2017 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Json.Tests.UberTestClass Extends Cogs.JsonClass
{

Property TestBooleanYes As %Boolean;

Property TestBooleanNo As %Boolean;

Property TestNotBoolean1 As %String;

Property TestNotBoolean2 As %String;

Property TestNullString As %String;

Property TestStringNotNull As %String;

Property TestNullBoolean As %Boolean;

Property TestNullInteger As %Integer;

Property TestNullDate As %Date;

Property TestNullTimestamp As %TimeStamp;

Property TestTime As %Time;

Property TestStringOfJSON As %String;

Property TestInteger As %Integer;

Property TestDate As %Date;

Property TestTimestamp As %TimeStamp;

Property TestTimestampShort As %TimeStamp;

Property TestEscapes As %String;

Property TestString As %String;

Property TestZero As %Integer;

Property TestRawJson As Cogs.Lib.Types.Json;

Property TestLongString As %String;

Property TestLongNumber As %Integer;

Property TestAllAsciiChars As %String;

Property TestListOfString As list Of %String;

Property TestEmptyListOfString As list Of %String;

Property TestListOfBoolean As list Of %Boolean;

Property TestEmptyListOfBoolean As list Of %Boolean;

Property TestListOfOfDate As list Of %Date;

Property TestEmptyListOfOfDate As list Of %Date;

Property TestListOfOfInteger As list Of %Integer;

Property TestEmptyListOfOfInteger As list Of %Integer;

Property TestArrayOfString As array Of %String;

Property TestEmptyArrayOfString As array Of %String;

Property TestArrayOfBoolean As array Of %Boolean;

Property TestEmptyArrayOfBoolean As array Of %Boolean;

Property TestArrayOfDate As array Of %Date;

Property TestEmptyArrayOfDate As array Of %Date;

Property TestArrayOfInteger As array Of %Integer;

Property TestEmptyArrayOfInteger As array Of %Integer;

Property TestSingleObject As Cogs.Lib.Json.Tests.UberTestClass;

Property TestListOfObject As list Of Cogs.Lib.Json.Tests.UberTestClass;

Property TestArrayOfObject As array Of Cogs.Lib.Json.Tests.UberTestClass;

Property TestIgnoreFlag As %String(JSONIGNORE = 1);

Property ZTestJsonName As %String(JSONNAME = "_id");

Property ZTestJsonMethod As %String(JSONMETHOD = "..ToUpper(..TestLongString)");

ClassMethod ToUpper(pText As %String) As %String
{
	Quit $ZCVT(pText,"U")
}

}

