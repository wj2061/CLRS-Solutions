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

var ay = [1,4,23,53,64,86,544,43,54,5345,32,35,3]

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






