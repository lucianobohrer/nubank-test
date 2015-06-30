//
//  Operators.swift
//  ObjectMapper
//
//  Created by Tristan Himmelman on 2014-10-09.
//  Copyright (c) 2014 hearst. All rights reserved.
//

import Foundation

/**
* This file defines a new operator which is used to create a mapping between an object and a JSON key value.
* There is an overloaded operator definition for each type of object that is supported in ObjectMapper.
* This provides a way to add custom logic to handle specific types of objects
*/

// The operator definition is commented out because it was causing "ambiguous operator" errors when linking to the framework
// This seems like a bug in xcode will likely be fixed
// infix operator <= {}

// MARK:- Objects with Basic types
/**
* Object of Basic type
*/
public func <=<T>(inout left: T, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().basicType(&left, object: right.currentValue)
    } else {
        ToJSON().basicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional object of basic type
*/
public func <=<T>(inout left: T?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().optionalBasicType(&left, object: right.currentValue)
    } else {
        ToJSON().optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional object of basic type
*/
public func <=<T>(inout left: T!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<T>().optionalBasicType(&left, object: right.currentValue)
	} else {
		ToJSON().optionalBasicType(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Object of Basic type with Transform
*/
public func <=<T, Transform: TransformType where Transform.Object == T>(inout left: T, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.fromJSON {
        var value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON<T>().basicType(&left, object: value)
    } else {
        var value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON().optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/**
* Optional object of basic type with Transform
*/
public func <=<T, Transform: TransformType where Transform.Object == T>(inout left: T?, right: (Map, Transform)) {
    if right.0.mappingType == MappingType.fromJSON {
        var value: T? = right.1.transformFromJSON(right.0.currentValue)
        FromJSON<T>().optionalBasicType(&left, object: value)
    } else {
        var value: Transform.JSON? = right.1.transformToJSON(left)
        ToJSON().optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional object of basic type with Transform
*/
public func <=<T, Transform: TransformType where Transform.Object == T>(inout left: T!, right: (Map, Transform)) {
	if right.0.mappingType == MappingType.fromJSON {
		var value: T? = right.1.transformFromJSON(right.0.currentValue)
		FromJSON<T>().optionalBasicType(&left, object: value)
	} else {
		var value: Transform.JSON? = right.1.transformToJSON(left)
		ToJSON().optionalBasicType(value, key: right.0.currentKey!, dictionary: &right.0.JSONDictionary)
	}
}

// MARK:- Array of Objects with Basic Type - Array<AnyObject>
/**
* Array of objects with Basic types
*/
public func <=(inout left: Array<AnyObject>, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().basicType(&left, object: right.currentValue)
	} else {
		ToJSON().basicArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Optional array of objects with Basic type
*/
public func <=(inout left: Array<AnyObject>?, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().optionalBasicType(&left, object: right.currentValue)
	} else {
		ToJSON().optionalBasicArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Implicitly unwrapped optional array of objects with Basic type
*/
public func <=(inout left: Array<AnyObject>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().optionalBasicType(&left, object: right.currentValue)
	} else {
		ToJSON().optionalBasicArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Dictionary of Objects with Basic type - Dictionary<String, AnyObject>
/**
* Dictionary of objects with Basic type
*/
public func <=(inout left: Dictionary<String, AnyObject>, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().basicType(&left, object: right.currentValue)
	} else {
		ToJSON().basicDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Optional dictionary of objects with Basic type <String, AnyObject>
*/
public func <=(inout left: Dictionary<String, AnyObject>?, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().optionalBasicType(&left, object: right.currentValue)
	} else {
		ToJSON().optionalBasicDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

/**
* Implicitly unwrapped optional dictionary of objects with Basic type <String, AnyObject>
*/
public func <=(inout left: Dictionary<String, AnyObject>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<AnyObject>().optionalBasicType(&left, object: right.currentValue)
	} else {
		ToJSON().optionalBasicDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Mappable Objects - <T: Mappable>
/**
* Object conforming to Mappable
*/
public func <=<T: Mappable>(inout left: T, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().object(&left, object: right.currentValue)
    } else {
        ToJSON().object(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional Mappable objects
*/
public func <=<T: Mappable>(inout left: T?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().optionalObject(&left, object: right.currentValue)
    } else {
        ToJSON().optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped optional Mappable objects
*/
public func <=<T: Mappable>(inout left: T!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<T>().optionalObject(&left, object: right.currentValue)
	} else {
		ToJSON().optionalObject(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Dictionary of Mappable objects - Dictionary<String, T: Mappable>
/**
* Dictionary of Mappable objects <String, T: Mappable>
*/
public func <=<T: Mappable>(inout left: Dictionary<String, T>, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().objectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON().objectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional Dictionary of Mappable object <String, T: Mappable>
*/
public func <=<T: Mappable>(inout left: Dictionary<String, T>?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().optionalObjectDictionary(&left, object: right.currentValue)
    } else {
        ToJSON().optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped Optional Dictionary of Mappable object <String, T: Mappable>
*/
public func <=<T: Mappable>(inout left: Dictionary<String, T>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<T>().optionalObjectDictionary(&left, object: right.currentValue)
	} else {
		ToJSON().optionalObjectDictionary(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}

// MARK:- Array of Mappable objects - Array<T: Mappable>
/**
* Array of Mappable objects
*/
public func <=<T: Mappable>(inout left: Array<T>, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().objectArray(&left, object: right.currentValue)
    } else {
        ToJSON().objectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Optional array of Mappable objects
*/
public func <=<T: Mappable>(inout left: Array<T>?, right: Map) {
    if right.mappingType == MappingType.fromJSON {
        FromJSON<T>().optionalObjectArray(&left, object: right.currentValue)
    } else {
        ToJSON().optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
    }
}

/**
* Implicitly unwrapped Optional array of Mappable objects
*/
public func <=<T: Mappable>(inout left: Array<T>!, right: Map) {
	if right.mappingType == MappingType.fromJSON {
		FromJSON<T>().optionalObjectArray(&left, object: right.currentValue)
	} else {
		ToJSON().optionalObjectArray(left, key: right.currentKey!, dictionary: &right.JSONDictionary)
	}
}