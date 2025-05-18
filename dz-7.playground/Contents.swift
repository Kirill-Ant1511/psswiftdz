enum AdultError : Error {
    case isNotAdult
}

func verifyAge(_ age: Int) throws -> Bool {
    if age < 18 {
        throw AdultError.isNotAdult
    }
    return true
}

do {
    let result = try verifyAge(20)
    print(result)
} catch AdultError.isNotAdult {
    print("You are not an adult")
}
