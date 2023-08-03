import Foundation

/*
 * Complete the 'larrysArray' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts INTEGER_ARRAY A as parameter.
 */

func larrysArray(A: [Int]) -> String {
    // Write your code here
    if inversionCount(in: A) % 2 == 0 {
        return "YES"
    } else { 
        return "NO"
    }
}

// DOY COMMENT: 
// Kinda feel like merge sort 
// Let's say we have three elements like this. 
// As we want them to be sorted, every permutation's original form should also be ascending sorted one. For like: 
// (1,2,3) -> (2,3,1) -> (3,1,2) -> (1,2,3) 
// when count inversion, (2,3,1) and (3,1,2) has two inversions. 
// but there are also unsortable array there 
// (6,5,4) -> (5,4,6) -> (4,6,5) -> (6,5,4)
// when count inversion, 1, 3, the total of inversions ammong the array is odd numbers.
private func inversionCount(in arr: [Int]) -> Int {
    var count = 0
    for i in stride(from: arr.count - 1, through: 0, by: -1) {
        let current = arr[i]
        for j in stride(from: i - 1, through: 0, by: -1) {
            if arr[j] > current {
                count += 1
            }
        }
    }
    return count
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let t = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for tItr in 1...t {
    guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
    else { fatalError("Bad input") }

    guard let ATemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

    let A: [Int] = ATemp.split(separator: " ").map {
        if let AItem = Int($0) {
            return AItem
        } else { fatalError("Bad input") }
    }

    guard A.count == n else { fatalError("Bad input") }

    let result = larrysArray(A: A)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
