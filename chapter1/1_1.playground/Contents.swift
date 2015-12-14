import Darwin

func fnlgn(max:Double)->Int{
    var lower:Int = 0
    var upper:Int = Int( max )
    while true{
        let middle = (lower + upper)/2
        if middle == lower || upper == middle {
            return middle
        }
        if Double(middle) * log2 ( Double(middle)) > max{
            upper = middle
        }else{
            lower = middle
        }
    }
}

func fn_(max :Double)->Int{
    var result = 1
    for i in 2...Int(max){
        result *= i
        if result > Int(max){
            return i - 1
        }
    }
    return 1
}

let timeInSecond:[Double] = [1,60,60*60,60*60*24,60*60*24*30,60*60*24*365,60*60*24*365*100]
let time = timeInSecond.map { $0*1000000 }

let lgn  = time.map{ pow(2, $0)}
print(lgn)
// 2^{10^6} & $2^{6 * 10^7} & $2^{36 * 10^8} & $2^{864 * 10^8} & $2^{25920 * 10^8} & $2^{315360 * 10^{8}} & $2^{31536000 * 10^{8}}


let n0_5 = time.map { $0*$0 }
print(n0_5)

let n_1  = time.map{$0}
print(n_1)

let nlgn = time.map {fnlgn($0)}
print(nlgn)

let n2   = time.map {Int( pow($0, 0.5) )}
print(n2)

let n3  = time.map {Int( pow($0, 1.0/3.0) )}
print(n3)

let n_2  = time.map { Int( log2($0) )}
print(n_2)

let n_  = time.map { fn_($0) }
print(n_)






