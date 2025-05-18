import Foundation

class Circle {
    private let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return pow(self.radius, 2) * Double.pi
    }
}

let circle = Circle(radius: 20)
print(circle.area())
