/// Copyright (c) 2019 MemCog Ltd
/// Set GitHub documentation for help
Class Cogs.Lib.Util.ExportProject Extends %RegisteredObject
{

ClassMethod Export(pProjectName As %String, pVersion As %String = "", pRootFolder As %String = "D:\projects\cache\Cogs")
{
	set sc=$$$OK
	set key=""
	set del=$s($zv["Windows":"\",1:"/")
	if $e(pRootFolder,$l(pRootFolder))'=del set pRootFolder=pRootFolder_del
	set sc=##class(%File).RemoveDirectoryTree(pRootFolder_"tests")
	set sc=##class(%File).CreateDirectoryChain(pRootFolder_"tests")
	set sc=##class(%File).RemoveDirectoryTree(pRootFolder_"src")
	set sc=##class(%File).CreateDirectoryChain(pRootFolder_"src")
	set sc=##class(%File).CreateDirectoryChain(pRootFolder_"build\")
	set project=##class(%Studio.Project).%OpenId(pProjectName)
	set item=project.Items.GetNext(.key)
	while key'="" {
		if item.Type="CLS" {
			set sc=..ExportClass(item.Name,pRootFolder)
			if $$$ISERR(sc) goto exit
		} else {
			kill spec
			set spec($i(spec))=item.Name_"*"
			set sc=..ListClasses(.spec,.list)
			if $$$ISERR(sc) goto exit
			set className=$order(list(""))
			while className'="" {
				set sc=..ExportClass(className,pRootFolder)
				if $$$ISERR(sc) goto exit
				set className=$order(list(className))
			}
		}
		set item=project.Items.GetNext(.key)
	}
	set buildFile=pRootFolder_"build"_del_pProjectName_pVersion_".xml"
	set sc=project.Export(buildFile)
exit
	quit sc
}

ClassMethod ExportClass(pClassName As %String, pRootFolder As %String)
{
	set del=$s($zv["Windows":"\",1:"/")
	if pClassName[".Tests." {
		set fileFolder=pRootFolder_"tests"_del_$tr($p(pClassName,".",1,$l(pClassName,".")-1),".",del)_del
	} else {
		set fileFolder=pRootFolder_"src"_del_$tr($p(pClassName,".",1,$l(pClassName,".")-1),".",del)_del
	}
	set fileName=fileFolder_pClassName_".cls"
	set sc=##class(%File).CreateDirectoryChain(fileFolder)
	quit ##class(%Compiler.UDL.TextServices).GetTextAsFile(,pClassName,fileName)
}

ClassMethod ListClasses(spec, Output classes) As %Status
{
	kill classes
	set classes=0
	if spec=0 quit $$$OK
	set a="",sql="select Name from %Dictionary.CompiledClass where "
	for i=1:1:spec {
		if $extract(spec(i))="-" {
			set sql=sql_a_"ID NOT Like '"_$replace($extract(spec(i),2,500),"*","%")_"'"			
		} else {
			set sql=sql_a_"ID Like '"_$replace(spec(i),"*","%")_"'"
		}
		set a=" and "
	}
	set rs=..Execute(.sc,sql) $$$QuitOnError(sc)
	while rs.Next() { set classes(rs.Get("Name"))="",classes=classes+1 }
	quit sc
}

ClassMethod Execute(Output sc As %Status, pSql As %String, pArgs...) As %ResultSet
{
	set rs=##class(%ResultSet).%New("%DynamicQuery:SQL")
	set sc=rs.Prepare(pSql) $$$QuitOnError(sc)
	set sc=rs.Execute(pArgs...) $$$QuitOnError(sc)
	Quit rs
}

}

