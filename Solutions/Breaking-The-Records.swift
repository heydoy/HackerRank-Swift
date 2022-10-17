import Foundation

func breakingRecords(scores: [Int]) -> [Int] {
    // Write your code here
    var max = scores[0]
    var maxCount = 0
    var min = scores[0]
    var minCount = 0
    scores.forEach {
        if $0 > max {
            max = $0 
            maxCount += 1
        } else if $0 < min {
            min = $0
            minCount += 1
        }
    }
    return [maxCount, minCount]
}
