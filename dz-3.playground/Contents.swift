/*
Кол-во яблок
*/

let count: UInt = 215

/*
 Строка содержащая слово яблоко в правильном сколнении:
 яблоко, яблок, яблока
*/
var apples = ""

if count % 100 >= 11 && count % 100 <= 14 || count % 10 >= 5 {
    apples = "яблок"
} else if count % 10 == 1 {
    apples = "яблоко"
} else if count % 10 >= 2 && count % 10 <= 4 {
    apples = "яблока"
}
/*
 Пример результата
 В корзине 1 яблоко.
 В корзине 15 яблок
 В корзине 154 яблока
*/
let result = "В корзине \(count) \(apples)."
print(result)
