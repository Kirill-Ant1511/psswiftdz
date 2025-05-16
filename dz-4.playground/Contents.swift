func getTextSize(before: (String) -> Void, forText text: String, completion: (Int) -> Void) {
    before(text) // Добавил для себя )
    completion(text.count)
}


getTextSize(before: {
    print("Считаем длину строки '\($0)' ...")
}, forText: "Привет, Мир!") {
    print("Длина строки: \($0) символов")
}
