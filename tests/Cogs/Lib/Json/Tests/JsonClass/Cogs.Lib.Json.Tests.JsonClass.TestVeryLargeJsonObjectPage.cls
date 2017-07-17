Class Cogs.Lib.Json.Tests.JsonClass.TestVeryLargeJsonObjectPage Extends %CSP.Page
{

ClassMethod OnPreHTTP() As %Boolean [ ServerOnly = 1 ]
{
	set %response.ContentType="application/javascript; charset=utf-8;"
	quit 1
}

ClassMethod OnPage() As %Status [ ServerOnly = 1 ]
{
	write ##class(Cogs.Lib.Json.Tests.JsonClass.UberTestClass).CreateTestObject4().toJSON()
	quit $$$OK
}

}

