import UIKit

struct Contacts {
    var email: String?
    var address: [String: String]
}

struct Person {
    var name: String
    var contacts: Contacts
    
    init(name: String, email: String, address: String){
        self.name = name
        contacts = Contacts(email: email, address: ["home" : address])
    }
    func getContacts() -> Contacts? {
        return contacts
    }
}


var sodeul: Person? = Person(name: "SodeulSodeul", email: "Sodeul@naver.com", address: "Suwon")

sodeul?.getContacts()?.email //함수의 리턴값이 Optional인 경우엔 함수를 호출하는 () 뒤에 ?를 붙여준다
////////////////////////////////////////////////////////////////////////////

var yeosong = ("y", 27, 177)
type(of: yeosong)
print(yeosong.0)
print(yeosong.1)
print(yeosong.2)

// let으로 선언하면 Immutable Tuple, var로 선언하면 Mutable Tuple
yeosong.0 = "kim"
yeosong.0

yeosong = (name: "y", age: 27, height: 177)
let (name, age, height) = yeosong
