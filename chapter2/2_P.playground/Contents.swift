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

func mergeSort(var ay1:[Int],var ay2:[Int])->([Int],Int){
    var result = [Int]()
    var inversion = 0
    while ay1.count > 0 && ay2.count > 0{
        if ay1[0] <= ay2[0]{
            result.append(ay1.removeFirst())
        }else{
            inversion += ay1.count
            result.append(ay2.removeFirst())
        }
    }
    
    result.appendContentsOf(ay1)
    result.appendContentsOf(ay2)
    return (result,inversion)
}


func inversionSort(ay:[Int])->([Int],Int){
    if ay.count <= 1 {return (ay,0)}
    let middle = ay.count/2
    
    var inversion = 0
    var ay1 = (ay as NSArray).subarrayWithRange(NSMakeRange(0, middle)) as! [Int]
    var ay2 = (ay as NSArray).subarrayWithRange(NSMakeRange(middle, ay.count-middle)) as! [Int]
    var result = inversionSort(ay1)
    ay1 = result.0
    inversion += result.1
    
    result = inversionSort(ay2)
    ay2 = result.0
    inversion += result.1
    
    result  =  mergeSort(ay1, ay2: ay2 )
    let ayf    = result.0
    inversion += result.1
    
    return (ayf,inversion)
}

inversionSort([2,3,8,6,1])


