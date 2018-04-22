
import Foundation
import Commander

let main = command(
    Argument<String>("path")
) { path in
    guard let data = FileManager.default.contents(atPath: path),
          let testData = String(data: data, encoding: .utf8) else {
        print("Failed to Open \(path)")
        exit(EXIT_FAILURE)
    }

    var uf = WeightedQuickUnionPathCompression(num: 10)
    testData.enumerateLines(invoking: { (line, stop) in
        let pq = line.components(separatedBy: " ")
        let p = Int(pq[0])!
        let q = Int(pq[1])!
        
        if(uf.connected(p, q) == false) {
            uf.union(p, q)
            print("\(p) + \(q)")
        }
    })
    
}

main.run()
