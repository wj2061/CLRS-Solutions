//8.P-2

// a  Counting-Sort
// b  Quicksort-Partition
// c  Insertion-Sort
// d  (a) Yes (b) No (c) No

let k = 10

func CountedSorted(inout ay:[Int]){
    var temAy = Array.init(count: k, repeatedValue: 0)
    for i in ay{
        temAy[i]++
    }
    print(temAy)

    for i in 1..<k{
        temAy[i] += temAy[i-1]
    }
    print(temAy)
    
    var i = ay.count-1
    
    while i>=0{
        let v = ay[i]
        let pos = temAy[v] - 1
        if i > pos {
            i--
        } else if v != ay[pos]{
            swap(&ay[i], &ay[pos])
            temAy[v]--
        }else{
            temAy[v]--
        }
    } 
}

var ay = [2,4,4,8,9,0,3,7,9,4,2,1,4,3,6]
CountedSorted(&ay)

