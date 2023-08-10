import Foundation

// Complete the catAndMouse function below.
func catAndMouse(x: Int, y: Int, z: Int) -> String {
    // x: Cat A, y: Cat B, z, Mouse C
    
    if abs(x-z) < abs(y-z) {
        return "Cat A" 
    } else if abs(x-z) > abs(y-z) {
        return "Cat B"
    } else {
        return "Mouse C"
    }

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let q = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

for qItr in 1...q {
    guard let xyzTemp = readLine() else { fatalError("Bad input") }
    let xyz = xyzTemp.split(separator: " ").map{ String($0) }

    guard let x = Int(xyz[0].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let y = Int(xyz[1].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    guard let z = Int(xyz[2].trimmingCharacters(in: .whitespacesAndNewlines))
    else { fatalError("Bad input") }

    let result = catAndMouse(x: x, y: y, z: z)

    fileHandle.write(result.data(using: .utf8)!)
    fileHandle.write("\n".data(using: .utf8)!)
}
