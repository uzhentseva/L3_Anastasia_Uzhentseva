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
    
}

var car1 = Car(brand: "Skoda", year: 2018, capacity: 50, motorState: .on, windowOpen: .open, carrierLoad: 35)

print("Авто марки \(car1.brand)")
car1.closeWindow()
car1.motorState = .off

print("\n")

car1.carrierLoad = 20
car1.carrierLoad = 17
car1.carrierLoad = 13

car1.printLoad()
car1.capaсityLeft()
