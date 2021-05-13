# FlatMany

*flatMap --> Publishers.MergeMany --> map --> collect*

## What does FlatMany do?
When you have a `Publisher` which has an Output that is a sequence. FlatMany makes it easy to map each element of that sequence into a publisher.

## Usage
```swift
import FlatMany
```

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
