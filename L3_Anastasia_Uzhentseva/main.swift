//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

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
            print("Авто загружено на \(oldValue) литров")
            let space = capacity - oldValue                          // считает правильно
            print("Можно загрузить авто ещё на \(space) литров")
        }
//        willSet {
//            let newSpace = newValue - carrierLoad                  // считает неправильно! проверить что и как
//            print("После загрузки осталось \(newSpace) литров")
//        }
    }
    
    func printLoad() {                                               // вывод информации о загрузке багажника
        print("Авто загружено на \(carrierLoad) литров")
    }
    
    func capaсityLeft() {
        let freeSpace = capacity - carrierLoad
//        if carrierLoad > capacity {
//            print("Загрузка больше вместимости!")
//        }
        print("Ещё можно загрузить \(freeSpace) литров")
    }
    
}

// ещё нужна проверка на капасити багажника! чтобы загрузка не больше вместимости - Где это можно сделать?
// сделать иниты()?? Надо?

var car1 = Car(brand: "Skoda", year: 2018, capacity: 50, motorState: .on, windowOpen: .open, carrierLoad: 35)

print("Авто марки \(car1.brand)")

car1.closeWindow()
car1.motorState = .off

car1.carrierLoad = 20

car1.printLoad()
car1.capaсityLeft()



//struct Truck {
//    let brandTruck: String
//    let yearTruck: Int
//    let bodyVol: Double
//    var motorOn: motorOn
//    var windowOpen: windowOpen
//    var bodyLoad: Double
//}
//var truck1 = Truck(brandTruck: "Volvo", yearTruck: 2010, bodyVol: 500, motorOn: .off, windowOpen: .close, bodyLoad: 2)
