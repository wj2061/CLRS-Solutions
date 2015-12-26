import UIKit

//5.P-2.a
let X  = 22
let ay = [3,2,4,3,543,334,332,54,43,21];
var i  = -1
var st:Set<Int> = []

while true{
    i  = random()%(ay.count)
    if ay[i] == X{
        break;
    }
    st.insert(i)
    if st.count == ay.count{
        i = -1
        break;
    }
}
print(i)

//5.P-2.b
// n

//5.P-2.c
// n/k

//5.P-2.d
//n(lgn)

//5.P-2.e
// average: n/2
//worst: n

//5.P-2.f
//average: n/(k+1)
//worst:   n-k+1

//5.P-2.g
//average: n
//worst:   n

//5.P-2.h
//average: n/(k+1)
//worst:   n-k+1

//5.P-2.i
//DETERMINISTIC-SEARCH





