import UIKit

class Animal {
    var brain: Bool
    var legs: Int
    
    init(brain: Bool = true, legs: Int = 0) {
        self.brain = brain
        self.legs = legs
    }
}

class Human: Animal {
    var lang : String
    
    override var legs: Int {
        get {
            print("내 다리는 \(super.legs)개")
            return super.legs
        }
        set {
            super.legs = newValue
        }
    }
    
    init(legs: Int = 2, lang: String = "korean") {
        self.lang = lang
        super.init(legs: legs)
    }
}


class Pet: Animal {
    var fleas: Int
    
    init(fleas: Int = 0, legs: Int = 4) {
        self.fleas = fleas
        super.init(legs: legs)
    }
}

class Dog: Pet {
    init(fleas: Int = 8) {
        super.init(fleas: fleas)
    }
}

class Cat: Pet {
    init(fleas: Int = 4) {
        super.init(fleas: fleas)
    }
}


//var animal = Animal(brain: false, legs: 6)
var animal = Animal()
animal.brain
animal.brain = true
animal.brain
animal.legs


var human = Human()
human.legs
human.legs = 4
human.legs


var pet = Pet()
pet.brain
pet.fleas
pet.legs


var dog = Dog()
dog.brain
dog.fleas
dog.legs


var cat = Cat()
cat.brain
cat.fleas
cat.legs
