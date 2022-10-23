import Foundation

/*
 * Complete the 'matchingStrings' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts following parameters:
 *  1. STRING_ARRAY strings
 *  2. STRING_ARRAY queries
 */

func matchingStrings(strings: [String], queries: [String]) -> [Int] {
    // Write your code here
    var result: [Int] = []
    queries.forEach {
        var sum = 0
        for i in strings {
            if i == $0 { sum += 1}
        }
        result.append(sum)
    }
    return result
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let stringsCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var strings = [String]()

for _ in 1...stringsCount {
    guard let stringsItem = readLine() else { fatalError("Bad input") }

    strings.append(stringsItem)
}

guard strings.count == stringsCount else { fatalError("Bad input") }

guard let queriesCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

var queries = [String]()

for _ in 1...queriesCount {
    guard let queriesItem = readLine() else { fatalError("Bad input") }

    queries.append(queriesItem)
}

guard queries.count == queriesCount else { fatalError("Bad input") }

let res = matchingStrings(strings: strings, queries: queries)

fileHandle.write(res.map{ String($0) }.joined(separator: "\n").data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
