let array = [
    [[1, 2, 3, 4]],
    [[5, 6, 7, 8]],
    [[9, 10]]
]
let result = array.flatMap {$0}.flatMap{$0}.reduce(0) {$0 + $1}
print(result)
