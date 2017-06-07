## Cogs.JsonClass

Cogs.JsonClass enables serialisation and derserialisation of JSON to and from registered and persistent Cache classes.

### Simple Example

To use the Cogs.JsonClass, take any existing registered or persistent class and extend it with Cogs.JsonClass.

```COS
Class Example.Person Extends (%Persistent, Cogs.JsonClass)
{

Property FirstName As %String;

Property LastName As %String;

Property DateOfBirth As %Date(JSONNAME = "BirthDate");

Property Secret As %String(JSONIGNORE = 1);

Property Hobbies As list Of %String;

}
```

The person class now inherits two methods, toJSON() and parseJSON().

We can open an object instance of person and output its JSON serialisation using its toJSON() method.

```COS
set person=##class(Example.Person).%OpenId(1)
write !,person.toJSON()
```

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

Or create a new instance of person from a JSON string using its parseJSON() class method.

```JSON
set person=##class(Example.Person).parseJSON(json)
set sc=person.%Save()
```

### Automatic Type Conversions

The JSON specification (http://www.json.org/) defines a number of types that include object, array, string, number, true, false and null.

The JsonClass will automatically convert these types to and from internal types within Caché.

In addition, JsonClass also converts properties that are of type Time, Date and TimeStamp. These dates and times must be in W3C format.

* YYYY-MM-DDThh:mm:ss
* YYYY-MM-DD
* hh:mm:ss

https://www.w3.org/TR/NOTE-datetime

Numbers (Float, Integer, Numeric, Currency) are automatically converted to and from JSON numbers. Except for numbers that have preceding zero (e.g. 0123), in this instance they are serialised as strings.

Properties that are of type boolean will auto convert true to 1 and false to 0 and visa versa.

The null type will be lost in translation for all property types except for string, where it will be converted to $c(0).

### Object Properties

Properties that are an object must implement a class that also extends Cogs.JsonClass.

A serialisation or deserialation of the parent class will cascade down through its child class, its childs children and so on.

### Caché Arrays Type

Caché type arrays contain key value pairs and will be projected to JSON as if it was an object.

```COS
"ArrayOfString":{  
      "ALPHA": "Hello",
      "BRAVO": "Sheds",
      "CHARLIE": "World",
      "DELTA": "Foo",
      "ECHO": "Bar"
}
```

In reverse a JSON child object could be mapped to a concrete child class, or projected as an array. If the object is likely to grow or change then this might be a good generic option to use.

### Caché Lists Type

Caché lists type contains a list of values, these are projected as an array of values in JSON.

```JSON
"ListOfDates":[  
      "1980-12-31",
      "1941-01-10",
      "1968-05-18",
      "1914-10-16",
      "1978-11-27",
      "1951-04-10",
      "1993-09-27"
]
```

### Arrays of Arrays

Arrays of Arrays are a valid JSON construct but can not have a logical mapping into a class structure.

If you need to design a solution around existing JSON that has an array of arrays then use the generic *Cogs.Json class to split the outer array and then programatically assign the inner arrays into an array of objects.

*This class is currently not available in this release.

### Storing Raw JSON

A property can contain raw JSON by using the special type Cogs.Lib.Types.Json

The Cogs.Lib.Types.Json type is essentially a string type with its own JSON parser method. The method will strip out the JSON property as a raw string and will assign it as a string to the object property. This will include all descendants of the JSON property.

```COS
Property SchemaFreeData As Cogs.Lib.Types.Json;
```

### Overiding JSON property names

The name provided for a JSON property will be exactly the same name of its target property name.

This can be overriden using the JSONNAME attribute. Apply this attribute to any property and its string value will be used for both serialisation and deserialsation of the JSON.

```COS
Property DateOfBirth As %Date(JSONNAME = "BirthDate");
```

### Keeping properties a secret

When serialising a class there might be one or more properties that should not be projected to the consumer.

Simply add a JSONIGNORE=1 attribute to the property and the property value will be kept a secret.

```COS
Property Secret As %String(JSONIGNORE = 1);
```

### Overriding the value of a property

Any property value can be overridden using the JSONMETHOD attribute.

```COS
Property ZTestJsonMethod As %String(JSONMETHOD = "..ToUpper(..TestLongString)");
```

The value of JSONMETHOD should be valid COS code that can be a call to a method or function passing in one or more of the objects property values.

Note that this only applies to serialised values.

### More examples

Take a look at the Cogs tests for more examples.

