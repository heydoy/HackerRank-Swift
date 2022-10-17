import Foundation

func miniMaxSum(arr: [Int]) -> Void {
    // Write your code here
    
    var min = 0
    var max = 0 
    
    let sortedArray = arr.sorted()

    for (index, value) in sortedArray.enumerated() {
        if index > 0 {
            max += value
        } 
        if index < arr.count - 1 {
            min += value
        }
    }
    
    print(min, max)
}
