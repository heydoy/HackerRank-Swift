import Foundation

/*
 * Complete the 'birthday' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER_ARRAY s
 *  2. INTEGER d
 *  3. INTEGER m
 */

func birthday(s: [Int], d: Int, m: Int) -> Int {
    // Write your code here
    // s array  size is always equal or less than 100 and greater or equal to 1
    // m is number of subarrays

    
    var number = 0    
    for i in 0..<s.count {
        var sum = 0
        var max = i + m
        if max <= s.count {
            for j in i..<max {
                sum += s[j]
            }
            if sum == d {
                number += 1
            }
        }
    }
    return number
    
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let sTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let s: [Int] = sTemp.split(separator: " ").map {
    if let sItem = Int($0) {
        return sItem
    } else { fatalError("Bad input") }
}

guard s.count == n else { fatalError("Bad input") }

guard let firstMultipleInputTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }
let firstMultipleInput = firstMultipleInputTemp.split(separator: " ").map{ String($0) }

guard let d = Int(firstMultipleInput[0])
else { fatalError("Bad input") }

guard let m = Int(firstMultipleInput[1])
else { fatalError("Bad input") }

let result = birthday(s: s, d: d, m: m)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
