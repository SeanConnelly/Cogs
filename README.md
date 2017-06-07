## Cogs Library

### Introduction

Cogs is a small code library that runs on Intersystems Caché.

The Cogs library currently provides functionality to serialise and deserialise JSON to and from registered and persistent Caché classes.

### Example

Extend any class with Cogs.JsonClass

```COS
Class Example.Person Extends (%Persistent, Cogs.JsonClass)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %Date(SONNAME="BirthDate");

Property Secret As %String(JSONIGNORE=1);

Property Hobbies As list Of %String;

}
```

take some JSON

```JSON
{  
   "BirthDate":"1970-03-25",
   "FirstName":"Sean",
   "Hobbies":[  
      "Photography",
      "Walking",
      "Football"
   ],
   "LastName":"Connelly"
}
```

parse and save it

```COS
set person=##class(Example.Person).parseJSON(json)
set sc=person.%Save()
```

now open the persistent object and call its toJSON() method...

```COS
set person=##class(Example.Person).%OpenId(1)
write !,person.toJSON()
```

and its as easy as that...

```JSON
{"BirthDate":"1970-03-25","FirstName":"Sean","Hobbies":["Photography","Walking","Football"],"LastName":"Connelly"}
```

### Motivation

To provide a one step serialiser and deserialiser of registered and persistent classes that work across all mainstream versions of Caché and Ensemble.

### Installation

Clone or download the project from GutHub.

The build folder contains the most recent build file as a single import.

Import the file directly into the namespace that you want to use it from, or import it into a central namespace and map the Cogs package to the required namespace(s).

### Documentation

Documentation can be found in the docs folder and is currently best viewed on the main GitHub site.

### Tests

Core unit tests are included in the test folder. These tests are developed using the Touchstone unit test solution. Unfortunately you will not be able to run these tests until Touchstone has been released (in the near future).

### License

The core Cogs library is released under the MPL 2.0 license. See the included license agreement for more details.

MPL 2.0 is a copyleft license that is easy to comply with. You must make the source code for any direct changes to the Cogs library available under MPL. You can combine the Cogs library with proprietary code without the copyleft licence affecting the proprietary code.  

Copyright (c) 2017 MemCog Ltd