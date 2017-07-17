/// Copyright (c) 2017 MemCog Ltd
/// Test fix for repeating object references
Class Cogs.Lib.Json.Tests.JsonClass.JsonClassTest5 Extends Cogs.Touchstone.TestClass
{

Parameter TestSuiteName = "Cogs.Lib.JSON";

Method Test1() As %Status(UNITTEST=1)
{
	set main=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass).%New()
	set mandate=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MandateTestClass).%New()
	set mandateStatus=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MandateStatus).%New()
	set mandateStatus.Status="Rejected"
	set mandateStatus.AuthenticationDate="2017-07-15T00:00:00.0000000"
	set mandateStatus.MandateBankReferenceNumber=""
	do mandateStatus.RejectReasons.Insert("")
	set mandate.Id="40444019-fb52-40bd-82fa-be3d51a90ac8"
	set mandate.Name="TestDebtor"
	set mandate.CreationDateUtc="2017-07-15T08:25:59.6670000"
	set mandate.MandateStatus=mandateStatus
	do main.MandateListDto.Insert(mandate)
	set main.PageIndex=1
	set main.PageSize=1
	do main.ErrorList.Insert("")
	set main.ResponseUtcTime="2017-07-16T10:28:42.8798267"
	do main.UserFriendlyDisplayList.Insert("")
	set json1=main.toJSON()
	set main2=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass).parseJSON(json1)
	set json2=main2.toJSON()
	do ..AssertEquals(json1,json2,"json should be the same")
	quit $$$OK
}

Method Test2() As %Status(UNITTEST=1)
{
	set json="{""MandateListDto"": [{""Id"": ""40444019-fb52-40bd-82fa-be3d51a90ac8"",""Name"": ""TestDebtor"",""CreationDateUtc"": ""2017-07-15T08:25:59.6670000Z"",""MandateStatus"": {""Status"": ""Rejected"",""AuthenticationDate"": ""2017-07-15T00:00:00.0000000Z"",""MandateBankReferenceNumber"": ""123"",""RejectReasons"": [""Invalid""]}}],""PageIndex"": 1,""PageSize"": 1,""ErrorList"": [],""ResponseUtcTime"": ""2017-07-16T10:28:42.8798267Z"",""UserFriendlyDisplayList"": []}"
	#dim main as Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass
	set main=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass).parseJSON(json)
	do ..AssertEquals(main.MandateListDto.GetAt(1).MandateStatus.Status,"Rejected","property value should match (1)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).MandateStatus.AuthenticationDate,"2017-07-15 00:00:00.0000000","property value should match (2)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).MandateStatus.MandateBankReferenceNumber,"123","property value should match (3)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).MandateStatus.RejectReasons.GetAt(1),"Invalid","property value should match (4)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).Id,"40444019-fb52-40bd-82fa-be3d51a90ac8","property value should match (5)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).Name,"TestDebtor","property value should match (6)")
	do ..AssertEquals(main.MandateListDto.GetAt(1).CreationDateUtc,"2017-07-15 08:25:59.6670000","property value should match (7)")
	do ..AssertEquals(main.PageIndex,1,"property value should match (8)")
	do ..AssertEquals(main.PageSize,1,"property value should match (9)")
	do ..AssertEquals(main.ErrorList.Size,0,"property value should match (10)")
	do ..AssertEquals(main.ResponseUtcTime,"2017-07-16 10:28:42.8798267","property value should match (11)")
	do ..AssertEquals(main.UserFriendlyDisplayList.Size,0,"property value should match (12)")
	quit $$$OK
}

Method Test3() As %Status(UNITTEST=1)
{
	set json="{""MandateListDto"": [{""Id"": ""40444019-fb52-40bd-82fa-be3d51a90ac8"",""Name"": ""TestDebtor"",""CreationDateUtc"": ""2017-07-15T08:25:59.6670000Z"",""MandateStatus"": {""Status"": ""Rejected"",""AuthenticationDate"": ""2017-07-15T00:00:00.0000000Z"",""MandateBankReferenceNumber"": """",""RejectReasons"": [""""]}}],""PageIndex"": 1,""PageSize"": 1,""ErrorList"": [],""ResponseUtcTime"": ""2017-07-16T10:28:42.8798267Z"",""UserFriendlyDisplayList"": []}"
	set json2="{""ErrorList"":[],""MandateListDto"":[{""CreationDateUtc"":""2017-07-15T08:25:59.6670000Z"",""Id"":""40444019-fb52-40bd-82fa-be3d51a90ac8"",""MandateStatus"":{""AuthenticationDate"":""2017-07-15T00:00:00.0000000Z"",""MandateBankReferenceNumber"":"""",""RejectReasons"":[""""],""Status"":""Rejected""},""Name"":""TestDebtor""}],""PageIndex"":1,""PageSize"":1,""ResponseUtcTime"":""2017-07-16T10:28:42.8798267Z"",""UserFriendlyDisplayList"":[]}"
	#dim main as Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass
	set main=##class(Cogs.Lib.Json.Tests.JsonClass.Issue4.MainTestClass).parseJSON(json)
	set json3=main.toJSON()
	do ..AssertEquals(json2,json3,"json should be the same")
	quit $$$OK
}

}

