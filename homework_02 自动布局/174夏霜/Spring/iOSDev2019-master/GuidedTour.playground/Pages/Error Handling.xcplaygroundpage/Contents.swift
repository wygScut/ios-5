//: ## Error Handling
//:
//: You represent errors using any type that adopts the `ErrorType` protocol.
//:
enum PrinterError: Error {
    case OutOfPaper
    case NoToner
    case OnFire
}

//: Use `throw` to throw an error and `throws` to mark a function that can throw an error. If you throw an error in a function, the function returns immediately and the code that called the function handles the error.
//:
func sendToPrinter(printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}

//: There are several ways to handle errors. One way is to use `do`-`catch`. Inside the `do` block, you mark code that can throw an error by writing `try` in front of it. Inside the `catch` block, the error is automatically given the name `error` unless you can give it a different name.
//:
do {
    let printerResponse = try sendToPrinter(printerName: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

//: - Experiment: Change the printer name to `"Never Has Toner"`, so that the `sendToPrinter(_:)` function throws an error.
//:
//: You can provide multiple `catch` blocks that handle specific errors. You write a pattern after `catch` just as you do after `case` in a switch.
//:
do {
    let printerResponse = try sendToPrinter(printerName: "Gutenberg")
    print(printerResponse)
} catch PrinterError.OnFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//: - Experiment: Add code to throw an error inside the `do` block. What kind of error do you need to throw so that the error is handled by the first `catch` block? What about the second and third blocks?
//:
//: Another way to handle errors is to use `try?` to convert the result to an optional. If the function throws an error, the specific error is discarded and the result is `nil`. Otherwise, the result is an optional containing the value that the function returned.
//:
let printerSuccess = try? sendToPrinter(printerName: "Mergenthaler")
let printerFailure = try? sendToPrinter(printerName: "Never Has Toner")

//: Use `defer` to write a block of code that is always executed before a function returns, regardless of whether an error was thrown. You can use `defer` even when there is no error handling, to simplify functions that can return from several different places.
//:
var teaKettleHeating = false
func morningRoutine() throws {
    teaKettleHeating = true
    defer {
        teaKettleHeating = false
    }

    _ = try sendToPrinter(printerName: "Lanston")
    // Drink tea and read the newspaper.
}



//: [Previous](@previous) | [Next](@next)
