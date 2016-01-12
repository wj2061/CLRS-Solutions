import Darwin
//7.P-1
//QuickSort
func partition(inout ay:[Int],p:Int,r:Int)->Int{
    let x = ay[r]
    var i = p-1
    for  j in p..<r{
        if ay[j] <= x{
            i++
            if i != j{
                swap(&ay[i], &ay[j])
            }
        }
    }
    if i+1 != r{
        swap(&ay[i+1], &ay[r])
    }
    return i+1
}

func quicksort(inout ay:[Int],p:Int,r:Int){
    if p<r{
        let q = partition(&ay, p: p, r: r)
        quicksort(&ay, p: p, r: q-1)
        quicksort(&ay, p: q+1, r: r)
    }
}

var ay = [1,4,23,53,64,86,544,23,54,5345,23,35,3,7]

quicksort(&ay, p: 0, r: 12)

//the QUICKSORT procedure to use HOARE-PARTITION 
func hoarePartition(inout ay:[Int],p:Int,r:Int)->Int{
    let x = ay[p]
    var i = p-1
    var j = r+1
    while true{
        repeat {j-- } while ay[j]>x
        repeat {i++ }  while ay[i]<x
        if  i < j {
            swap(&ay[i], &ay[j])
        }else {
            return j
        }
    }
}
func hoareSort(inout ay:[Int],p:Int,r:Int){
    if p<r{
        let q = hoarePartition(&ay, p: p, r: r)
        quicksort(&ay, p: p, r: q-1)
        quicksort(&ay, p: q+1, r: r)
    }
}

var ay1 = [1,4,23,53,64,86,544,43,54,5345,32,35,3]

hoareSort(&ay1, p: 0, r: 12)

//7.P-2
//a  n*lgn
//b  Quicksort with equal element values
func equalpartition(inout ay:[Int],p:Int,r:Int)->(Int,Int){
    var t = 0
    let x = ay[r]
    var i = p-1
    for  j in p..<r{
        if ay[j] < x{
            i++
            if i != j{
                swap(&ay[i], &ay[j])
            }
        }
        if ay[j] == x {
            t++
        }
    }
    if i+1 != r{
        swap(&ay[i+1], &ay[r])
    }
    return (i+1-t,i+1)
}

func randomizedPartition(inout ay:[Int],p:Int,r:Int)->(Int,Int){
    let  i = random()%(r-p+1) + p
    if i != r{
        swap(&ay[i], &ay[r])
    }
    let rs = equalpartition(&ay, p: p, r: r)
    return rs
}

func equalSort(inout ay:[Int],p:Int,r:Int){
    if p<r{
        let q = randomizedPartition(&ay, p: p, r: r)
        equalSort(&ay, p: p, r: q.0-1)
        equalSort(&ay, p: q.1+1, r: r)
    }
}

var ay2 = [1,4,23,53,64,86,544,23,54,5345,23,35,3,7]

equalSort(&ay2, p: 0, r: 13)


//7.P-4
//b Worst-Case   q = r each time

//c 
func tailRecursive(inout ay:[Int],var p:Int,r:Int){
    while p<r{
        let q = partition(&ay, p: p, r: r)
        tailRecursive(&ay, p: p, r: q-1)
        p  = q + 1
    }
}
var ay3 = [1,4,23,53,64,86,544,23,54,5345,23,35,3,7]
tailRecursive(&ay3,p: 0,r: 13)

func tailRecursive1(inout ay:[Int],var p:Int,var r:Int){
    while p<r{
        let q = partition(&ay, p: p, r: r)
        
        if q - p < r - q{
            tailRecursive1(&ay, p: p, r: q-1)
            p  = q + 1
        }else{
            tailRecursive1(&ay, p: q+1, r: r)
            r  = q - 1
        }
    }
}

var ay4 = [1,4,23,53,64,86,544,23,54,5345,23,35,3,7]
tailRecursive1(&ay4,p: 0,r: 13)

//7.P-5
//a  P(i) = 6(i - 1)(n - i)/n(n - 1)(n - 2)
//b  3/2n


//7.P-6
func intersects(a:(Int,Int),b:(Int,Int))->Bool{
    return a.0 <= b.1 && b.0 <= a.1
}

func before(a:(Int,Int),b:(Int,Int))->Bool{
    return a.1 < b.0
}

func fuzzyPartition(inout ay:[(Int,Int)],p:Int,var r:Int)->(Int,Int){
//    let  i = random()%(r-p+1) + p
//    if i != r{
//        swap(&ay[i], &ay[r])
//    }
    
    var t = 0
    let x = ay[r]
    var i = p-1
    for  j in p..<r{
        if ay[j].1 < x.0{
            i++
            if i != j{
                swap(&ay[i], &ay[j])
            }
        }
        if intersects(ay[j], b: x){
            t++
        }
    }
    if i+1 != r{
        swap(&ay[i+1], &ay[r])
    }
    return (i+1-t,i+1)
    
}

func fuzzySort(inout ay:[(Int,Int)],p:Int,r:Int){
    if p < r {
        let piovt = fuzzyPartition(&ay, p: p, r: r)
        print(piovt)
//        fuzzySort(&ay, p: piovt.0, r: piovt.1)
        fuzzySort(&ay, p: p, r: piovt.0-1)
        fuzzySort(&ay, p: piovt.1+1, r: r)
    }
}

var ay5 = [(2,4),(0,1),(3,5),(-1,-2),(0,99)]
fuzzySort(&ay5, p: 0, r: 4)





