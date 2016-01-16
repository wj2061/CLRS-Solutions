//: Playground - noun: a place where people can play
//8.2-4


var  k = 10


func findAandB(ay:[Int],a:Int,b:Int) ->Int{
    var ay1 = Array.init(count: k+1, repeatedValue: 0)
    for i in ay{
        ay1[i]++
    }
    for j in 1...k{
        ay1[j] = ay1[j-1] + ay1[j]
    }
    if a == 0{
        return ay1[b]
    }else{
        return ay1[b] - ay1[a-1]
    }
}

findAandB([2,4,1,5,6,5,7,4,0,1,7,4],a: 2,b: 8)
