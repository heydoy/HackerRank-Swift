import Foundation

/*
 * Complete the 'encryption' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func encryption(s: String) -> String {
    // Write your code here
    // remove all spaces
    let trimmedStr = s.trimmingCharacters(in: .whitespaces)
    let arrayStr = Array(trimmedStr).map { String($0) }
    
    // calculate root number from trimmedStr's length
    let sqrtNumber = sqrt(Double(arrayStr.count))
    let col = Int(ceil(sqrtNumber))
    var row = Int(floor(sqrtNumber))
    
    if col * row < arrayStr.count {
        row = col
    }
    print(col, row, arrayStr.count)
        
    var solution = ""
    var line = Array<String>(repeating: "", count: col)

    for j in 0..<row {
        for k in 0..<col {
            if (j * col + k) < arrayStr.count {
                line[k] += arrayStr[(j*col+k)]
            }
        }
    }
    solution = line.joined(separator: " ")
    return solution
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = encryption(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
