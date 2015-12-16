//2.3-1
// [3,9,26,38,41,49,52,57]
// [3,26,41,52]   [9,38,49,57]
// [3,41] [26,52] [38,57] [9,49]
// [3] [41] [52] [26] [38] [57] [9] [49]


//2.3-2
func mergeSort(var ay1:[Int],var ay2:[Int])->[Int]{
    var result = [Int]()
    while ay1.count > 0 && ay2.count > 0{
        if ay1[0] < ay2[0]{
            result.append(ay1.removeFirst())
        }else{
            result.append(ay2.removeFirst())
        }
    }
    
    result.appendContentsOf(ay1)
    result.appendContentsOf(ay2)
    return result
}

mergeSort([1,3,4,6,8], ay2: [0,2,5,7,8,9])


//2.3-4      
func recurseSort(var ay:[Int])->[Int]{
    guard ay.count > 1 else {return ay}
    let last = ay.removeLast()
    ay = recurseSort(ay)
    
    for i in 0..<ay.count{
        if last < ay[i]{
            ay.insert(last, atIndex: i)
            return ay
        }
    }
    ay.append(last)
    return ay
}

recurseSort([2,5,2,4,45,25,73,72,34,43])

//2.3-5
private func binaryRecurseSearch(v:Int ,ay:[Int],begin:Int,end:Int)->Int?{
    if begin > end   {return nil}
    if begin == end  {return ay[begin] == v ? begin : nil}
    
    let mid = (begin + end)/2
    if ay[mid] == v {return mid}
    if ay[mid] < v  {return binaryRecurseSearch(v, ay: ay, begin: mid+1, end: end)}
    else            {return binaryRecurseSearch(v, ay: ay, begin: begin, end: mid-1)}
    
}

func binarySearch(v:Int,ay:[Int])->Int?{
    return binaryRecurseSearch(v, ay: ay, begin: 0, end: ay.count-1)
}

func binarySearch1(v:Int,ay:[Int])->Int?{
    var begin = 0
    var end   = ay.count-1
    var mid   = (begin + end)/2
    while mid != begin && mid != end{
        if ay[mid] == v {return mid}
        if ay[mid] <  v {
            begin = mid
            mid   =  (begin + end)/2
        }else{
            end = mid
            mid =  (begin + end)/2
        }
    }
    if ay[begin] == v {return begin}
    if ay[end]   == v {return end}
    return nil
}

binarySearch(98, ay: [2,5,7,25,46,78,98])
binarySearch1(98, ay: [2,5,7,25,46,78,98])

//2.3-6 
//NO

//2.3-7
func canAddupTo(total:Int,ay:[Int])->Bool{
    guard ay.count >= 2 else {return false}
    var sortedAy = recurseSort(ay)
    var reverseAy = sortedAy.map{total - $0}
    
    while sortedAy.count > 0 && reverseAy.count > 0{
        if sortedAy.first! == reverseAy.last!{
            return true
        }else if sortedAy.first! > reverseAy.last!{
            reverseAy.removeLast()
        }else{
            sortedAy.removeFirst()
        }
    }
    return false
}

canAddupTo(13, ay: [2,3,43,42,3,1,6,5,9,10])







