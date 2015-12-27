//6.P-1
// a (1,2,3)

//6.P-2
//a
extension Array{
    func parent(i:Int,d:Int)->Int{
        return i/d
    }
    
    func child(i:Int,k:Int,d:Int)->Int{
        return i*d + k
    }
}

//b   Int(logd(n)+1)

//c  d*logd(n)

//d  logd(n)

//e  logd(n)

//6.P-3
//a  
//2,3,9,12
//4,8,14,∞
//5,∞,∞,∞
//16,∞,∞,∞









