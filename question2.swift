import Foundation 

func max_three(_ x: Int, _ y: Int, _ z: Int) -> Int {
    if x > y, x > z 
    {
        return x
    } 
    else if y > z, y > x 
    {
        return y
    } 
    else if z > y, z > x 
    {
        return z
    } 
    else if x == y, y > z 
    {
        return x
    }
    else if y == z, z > x 
    {
        return y
    } 
    else 
    {
        return x
    }
}

print(max_three(1, 2, 3))
print(max_three(3, 2, 1))
print(max_three(-3, -2, 0))
