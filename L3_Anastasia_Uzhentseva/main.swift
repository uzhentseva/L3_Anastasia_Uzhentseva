import Foundation

enum motorState {                       // состояние двигателя : вкл, выкл
    case on, off
}

enum windowOpen {                       // состояние окна : открытое, закрытое
    case open, close
}

struct Car {                            // структура авто
    let brand: String
    let year: Int
    let capacity: Double
    var motorState: motorState {
      
        willSet {                       // значение работы двигателя
            if newValue == .on {
                print("Двигатель работает")
            } else {
                print("Двигатель не работает")
            }
        }
    }
    
    var windowOpen: windowOpen
    
    mutating func openWindow() {        // функции изменения положения окна
        self.windowOpen = .open
        print("Окно открыто")
    }
    mutating func closeWindow() {
        self.windowOpen = .close
        print("Окно закрыто")
    }
    
    var carrierLoad: Double {
        
        didSet {                                                     // вывод информации о свободном месте багажника
            print("2. Авто было загружено на \(oldValue) литров")
        }
        willSet {
            print("1. \(newValue) - новое значение загрузки")
        }
    }
    
    func printLoad() {                                               // вывод информации о загрузке багажника
        print("Авто загружено на \(carrierLoad) литров")
    }
    
    func capaсityLeft() {
        let freeSpace = capacity - carrierLoad
        print("Ещё можно загрузить \(freeSpace) литров")
    }
    
    func load(volume: Double) {                                      // погрузить/выгрузить груз опеределённого объёма
        let vol = carrierLoad + volume
        print("В багажнике теперь загружено всего \(vol) литров объёма ")
    }
    
    func unload(volume: Double) {
        print("Из багажника выгрузили \(volume) литров объёма ")
    }
}

var car1 = Car(brand: "Skoda", year: 2018, capacity: 50, motorState: .on, windowOpen: .open, carrierLoad: 35)

print("Авто марки \(car1.brand)") //выводим марку, состояние окна и двигателя
car1.closeWindow()
car1.openWindow()
car1.motorState = .off
car1.motorState = .on

print("\n")

car1.carrierLoad = 20 // добавляем груз
car1.carrierLoad = 17
car1.carrierLoad = 13

print("\n")

car1.printLoad() // выводим инфо о загрузке багажника
car1.capaсityLeft() // об оставшемся объёме

print("\n")

car1.load(volume: 5) // грузим
car1.unload(volume: 5) // выгружаем

print("\n")

print(car1)


//        КОНСОЛЬ:
//        Авто марки Skoda
//        Окно закрыто
//        Окно открыто
//        Двигатель не работает
//        Двигатель работает
//
//        1. 20.0 - новое значение загрузки
//        2. Авто было загружено на 35.0 литров
//        1. 17.0 - новое значение загрузки
//        2. Авто было загружено на 20.0 литров
//        1. 13.0 - новое значение загрузки
//        2. Авто было загружено на 17.0 литров
//
//        Авто загружено на 13.0 литров
//        Ещё можно загрузить 37.0 литров
//
//        В багажнике теперь загружено всего 18.0 литров объёма
//        Из багажника выгрузили 5.0 литров объёма
//
//        Car(brand: "Skoda", year: 2018, capacity: 50.0, motorState: L3_Anastasia_Uzhentseva.motorState.on, windowOpen: L3_Anastasia_Uzhentseva.windowOpen.open, carrierLoad: 13.0)
