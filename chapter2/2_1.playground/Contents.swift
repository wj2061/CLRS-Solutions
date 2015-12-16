//2.1-1
extension Array{
    mutating func swith(indexA:Int,indexB:Int){
        let tem = self[indexA]
        self[indexA] = self[indexB]
        self[indexB] = tem
    }
}

var A = [31,41,59,26,41,58]
A.swith(3, indexB: 2)
A.swith(2, indexB: 1)
A.swith(1, indexB: 0)
A.swith(4, indexB: 3)
A.swith(5, indexB: 4)


//2.1-2
//INSERTION-SORT
func insertionSort(var ay:[Int])->[Int]{
    for j in 1..<ay.count{
        let key = ay[j]
        var i = j-1
        while i >= 0  && ay[i] > key{
            ay[i+1] = ay[i]
            i--
        }
        ay[i+1] = key
    }
    return ay
}

func reInsertionSort(var ay:[Int])->[Int]{
    for j in 1..<ay.count{
        let key = ay[j]
        var i = j-1
        while i >= 0 && ay[i] < key{
            ay[i+1] = ay[i]
            i--
        }
        ay[i+1] = key
    }
    return ay
}


var B = [31,41,59,26,41,58]
insertionSort(B)
reInsertionSort(B)

//2.1-3
func search(ay:[Int],v:Int)-> Int?{
    for j in 0..<ay.count{
        if ay[j] == v{
            return j
        }
    }
    return nil
}

search(B, v: 20)
search(B, v: 41)

//2.1-4
func addbinary(ay1:[Int],ay2:[Int])->[Int]{
    guard ay1.count == ay2.count else{return []}
    
    var result = [Int]()
    var c = 0
    for i in 0..<ay1.count{
        result.append((ay1[i] + ay2[i] + c)%2)
        c = (ay1[i] + ay2[i] + c)/2

    }
    result.append(c)
    return result
}

addbinary([1,1,0,0,1], ay2: [1,1,1,1,1])




