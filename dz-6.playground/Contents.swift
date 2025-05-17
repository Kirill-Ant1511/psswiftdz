class Circle {
    private let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return self.radius * self.radius * 3.14
    }
}

let circle = Circle(radius: 20)
print(circle.area())
