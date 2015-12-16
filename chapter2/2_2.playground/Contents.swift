//2.2-1
//O(n(^3))

//2.2-2
func selectionSort(var ay:[Int])->[Int]{
    for j in 0..<ay.count-1{
        var min = j
        for i in j+1..<ay.count{
            if ay[i] < ay[min]{
                min = i
            }
        }
        let tem = ay[min]
        ay[min] = ay[j]
        ay[j]   = tem
    }
    return ay
}

selectionSort([3,5,1,6,0])

//best  Θ(n*n)
//worst Θ(n*n)

//2.2-3
//average n/2    Θ(n)
//worst   n      Θ(n)



