import Foundation

/*
 * Complete the 'plusMinus' function below.
 *
 * The function accepts INTEGER_ARRAY arr as parameter.
 */

func plusMinus(arr: [Int]) -> Void {
    // Write your code here
    let size:Double = Double(arr.count)
    var plus:Double = 0 
    var zero:Double = 0
    var minus:Double = 0
    
    arr.forEach {
        if $0 == 0 {
            zero += 1
        } else if $0 < 0 {
            minus += 1
        } else {
            plus += 1
        }
    }
    
    let plusRatio = String(format: "%.6f", plus/size)
    let minusRatio = String(format: "%.6f", minus/size)
    let zeroRatio = String(format: "%.6f", zero/size)
    print(plusRatio, minusRatio, zeroRatio, separator: "\n")
}

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arrTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let arr: [Int] = arrTemp.split(separator: " ").map {
    if let arrItem = Int($0) {
        return arrItem
    } else { fatalError("Bad input") }
}

guard arr.count == n else { fatalError("Bad input") }

plusMinus(arr: arr)
