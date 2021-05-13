# FlatMany

*flatMap --> Publishers.MergeMany --> map --> collect*

## Usage

### Example
```swift
let task = Just<[Int]>([1, 2, 3])
    .flatMany {
        Just("\($0 * $0)").eraseToAnyPublisher()
    }
    .sink { values in
        print(values)
    }
```
