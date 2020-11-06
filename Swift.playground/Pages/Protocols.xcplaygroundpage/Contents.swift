/*
 프로토콜은 특정 작업이나 기능의 조각에 맞게 메서드, 속성 및 기타 요구 사항의 청사진을 정의한다.
 해당 요구 사항의 실제 구현을 제공하기 위해 클래스, 구조 또는 열거에서 프로토콜을 채택 할 수 있으며, 프로토콜의 요구 사항을 충족하는 모든 유형은 해당 프로토콜 을 준수 한다고한다.
 */


// Syntax
protocol SomeProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition gose here
}

struct SomeStructure: SomeProtocol {
    // structure definition gose here
}

class SomeClass: SomeProtocol, AnotherProtocol {
    // class definition gose here
}

// Property Requirements
/*
 프로토콜은 Property가 저장된 속성인지 계산 된 속성인지 여부를 지정하지 않고 필요한 Property 이름과 유형만 지정한다.
 프로토콜은 각 Property가 gettable인지, gettable 및 settable 인지 여부도 지정한다.
 Property 요구 사항은 항상 var키워드 접두사가 붙은 변수 속성으로 선언된다.
 */

protocol SomePropertyProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
    static var someTypeProperty: Int { get set }
}

// Example
protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "John Applessed")
print(john.fullName)

class Startship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Startship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

// Method Requirement
/*
 Method 는 일반 Method 와 똑같은 방식으로 작성되지만 중괄호나 Method 본문은 없다.
 프로토콜내에서 Method 기본값을 지정할 수 없다.
 */

protocol SomeMethodProtocol {
    static func someTypeMethod()
}

// Example
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}

let generator = LinearCongruentialGenerator()
print(generator.random())

// Mutating Method Requirement
/*
 프로토콜 인스턴스 메서드 요구 사항을로 표시 하면 클래스에 대한 해당 메서드의 구현을 작성할 때 키워드 mutating를 작성할 필요가 없다.
 */

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
