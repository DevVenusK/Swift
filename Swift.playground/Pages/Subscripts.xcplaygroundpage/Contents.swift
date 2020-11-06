
/*
Class, Struct, Enum 은 Collection, Dictionary 혹은 Sequance 에 접근하기 위한 Subscript를 정의할 수 있다.
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTalbe = TimesTable(multiplier: 3)
print(threeTimesTalbe[6])

/*
 Subscript 는 여러 입력 매개 변수를 사용할 수 있으며 이러한 입력 매개 변수는  모든 유형이 될 수 있다. Subscript는 모든 유형의 값을 반환 할 수도 있다.
 */

struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

// Type Subscript
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)