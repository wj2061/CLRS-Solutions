import UIKit

//2.P-2
func bubbleSort(var ay:[Int])->[Int]{
    guard ay.count > 1 else{return ay}
    
    for i in 1..<ay.count{
        for var j = ay.count-1;j>=i; j = j-1{
            if ay[j] < ay[j-1]{
                let tem = ay[j]
                ay[j]   = ay[j-1]
                ay[j-1] = tem
            }
        }
    }
    return ay
}

bubbleSort([7,5,2,22,32,32,43,142])

//0(n*n)   

//2.P-3
func horner(ay:[Int],x:Int)->Int{//0(n)
    var y = 0
    var i = ay.count-1
    while i >= 0{
        y = ay[i] + x*y
        i--
    }
    return y
}
horner([11,2], x: 13)

func polyHorner(ay:[Int],x:Int)->[Int]{//0(n*n)
    var result  = [Int]()
    for i in 0..<ay.count{
        var y = 0
        for  var j = i; j >= 0; j = j-1{
            y  = ay[j] +  x*y
        }
        result.append(y)
    }
    return result
}

polyHorner([1,2,3,4,5,6,7,8], x: 13)


//2.P-4
//(1,5)  (2,5)  (3,5) (4,5) (3,4)
//n*(n-1)/2

private

